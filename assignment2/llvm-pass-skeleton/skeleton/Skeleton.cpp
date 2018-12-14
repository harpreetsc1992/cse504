#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/IR/Dominators.h"
#include "llvm/IR/CFG.h"
#include "llvm/Analysis/CFG.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/InstrTypes.h"
#include "llvm/ADT/SmallVector.h"
#include "llvm/ADT/DepthFirstIterator.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include <string>
using namespace llvm;

#define CALC 0

std::string get_block_reference(const BasicBlock *BB)
{
	std::string block_address;
	raw_string_ostream string_stream(block_address);
	BB->printAsOperand(string_stream, false);

	return string_stream.str();
}

namespace 
{
	struct SkeletonPass : public FunctionPass 
	{
    	static char ID;
    	SkeletonPass() : FunctionPass(ID) {}
		DominatorTree *DT = new llvm::DominatorTree();

		int bbnum = 0, nested_loop_counter = 0;
		std::vector<BasicBlock *> predbbvec[100];
		std::vector<BasicBlock *> succbbvec[100];
    	virtual bool runOnFunction(Function &F) 
		{
			std::vector<const BasicBlock *> bbvec;
			std::vector<const BasicBlock *> fbvec;
			SmallVector<std::pair< const BasicBlock *, const BasicBlock *>, 0> Result;
			DT->recalculate(F);
			for (auto &BB : F)
			{				
				for(BasicBlock *Pred : predecessors(&BB))
				{
					predbbvec[bbnum].push_back(Pred);
				}
					
				for(BasicBlock *Succ : successors(&BB))
				{
					succbbvec[bbnum].push_back(Succ);
				}
#ifndef CALC
				outs() << "For Basic Block " << get_block_reference(&BB) << ":\n";
				for(std::vector<BasicBlock *>::iterator it_pred = predbbvec[bbnum].begin(); it_pred != predbbvec[bbnum].end(); ++it_pred) 
				{
					for(std::vector<BasicBlock *>::iterator it_succ = succbbvec[bbnum].begin(); it_succ != succbbvec[bbnum].end(); ++it_succ) 
					{
						outs() << "Predecessor " << get_block_reference(*it_pred) << " Successor " << get_block_reference(*it_succ) << "\n";
						if (it_pred == it_succ)
						{
							outs() << "One loop found \n";
							break;
						}	
					}
				}

				for(std::vector<BasicBlock *>::iterator it = predbbvec[bbnum].begin(); it != predbbvec[bbnum].end(); ++it) 
				{
					std::string preds_vec = get_block_reference(*it);
					outs() << preds_vec << " ";
				}
				outs() << "\n";
				for(std::vector<BasicBlock *>::iterator it = succbbvec[bbnum].begin(); it != succbbvec[bbnum].end(); ++it) 
				{
					std::string succ_vec = get_block_reference(*it);
					outs() << succ_vec << " ";
				}
				outs() << "\n";
#endif
				bbnum++;
			}
			FindFunctionBackedges(F, Result);
			int check = 0;	
			for (SmallVector<std::pair< const BasicBlock *, const BasicBlock *>, 0>::iterator it = Result.begin(); it != Result.end(); ++it)
			{
				bbvec.push_back((*it).second);
				fbvec.push_back((*it).first);
			}
			
			int bbcount = 0;
			int instcount = 0;
			for (int i = 0; i < bbvec.size(); i++)
			{
				for (auto &BB : F)
				{
					if (DT->dominates(bbvec[i]->getTerminator(), BB.getTerminator()))
					{
						bbcount++;
						for (auto &I : BB)
						{
							instcount++;
						}
					}
				}
				outs() << "Loop " << i+1 << " has " << bbcount << " Basic Blocks and " << instcount << " instructions\n";
				instcount = 0;
				bbcount = 0;
			}

			int nested_loop_counter = 0;
			if (bbvec.size() <= 0)
			{
				goto printnest;
			}
			else 
			{
				for (int i = 0; i < bbvec.size() - 1; i++)
				{
					if (DT->dominates(bbvec[i+1]->getTerminator(), bbvec[i]->getTerminator())) 
					{
						nested_loop_counter++;
					}
				}
				goto printnest;
			}
			printnest:
				outs() << "Function " << F.getName() << " has " << nested_loop_counter << " nested loops \n";
			
			return false;
		}
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
