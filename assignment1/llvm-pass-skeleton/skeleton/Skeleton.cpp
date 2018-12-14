#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/ADT/Statistic.h"
#include "llvm/IR/Instructions.h"
using namespace llvm;

namespace 
{
  struct SkeletonPass : public FunctionPass 
  {
    static char ID;
    SkeletonPass() : FunctionPass(ID) {}
    virtual bool runOnFunction(Function &F) 
	{
      unsigned memCounter = 0;
      unsigned brCounter = 0;
      unsigned arithCounter = 0;
	  for (auto &BB : F)
	  {
		// F is a pointer to a Function instance
		for (auto &I : BB)
		{
		  if (I.mayReadOrWriteMemory())
			memCounter++;
		  else if (I.isTerminator())
			brCounter++;
		  else 
		  	arithCounter++;
		  totalCounter++;
		}
        errs() << "function " << F.getName() << "\n";
		errs() << "Number of MemInst " << memCounter << "\n";
		errs() << "Number of BrInst " << brCounter << "\n";
		errs() << "Number of ArithInst " << arithCounter << "\n";
		errs() << "Number of totalInst " << totalCounter << "\n";

	  }
	  return false;
	}
private:
  unsigned totalCounter = 0;
  };
}

char SkeletonPass::ID = 0;
// Automatically enable the pass.
// http://adriansampson.net/blog/clangpass.html
static void registerSkeletonPass(const PassManagerBuilder &,
                         legacy::PassManagerBase &PM) 
{
  PM.add(new SkeletonPass());
}
static RegisterStandardPasses
RegisterMyPass(PassManagerBuilder::EP_EarlyAsPossible,
                 registerSkeletonPass);
