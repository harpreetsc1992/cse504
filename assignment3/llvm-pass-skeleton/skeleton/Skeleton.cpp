#include <vector>
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Analysis/LoopPass.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/User.h"

using namespace llvm;
using namespace std;

namespace 
{
  	struct SkeletonPass : public LoopPass 
  	{
    	static char ID;
        unsigned counter = 0, perf_nest = 0;
		vector<Loop *> loops;
		map<Loop *, Loop *> perfNest;
		vector<Loop *> outers;
    		SkeletonPass() : LoopPass(ID) {}
		int get_loop_ID(const BasicBlock *BB)
		{
    			std::string block_address;
    			raw_string_ostream string_stream(block_address);
    			BB->printAsOperand(string_stream, false);
			string s = string_stream.str();
			s.erase(0, 1);
    		return stoi(s);
		}

		void swappreHeader(BasicBlock *inPre, BasicBlock *outPre)
		{
			errs() << "In swap preheader\n";
			vector<Instruction *> storeInstO;
			vector<Instruction *> storeInstI;
			for (auto &Ii : *inPre)
			{
				if (StoreInst *SI = dyn_cast<StoreInst>(&Ii))
				{
					storeInstI.push_back(&Ii);
				}
			}
			for (auto &Io : *outPre)
			{
				if (StoreInst *SI = dyn_cast<StoreInst>(&Io))
				{
					storeInstO.push_back(&Io);
				}
			}
    			Instruction *iti = storeInstI.back(); 
    			Instruction *ito = storeInstO.back(); 
  
			Value *opI0 = iti->getOperand(0);
			Value *opI1 = iti->getOperand(1);
			Value *opO0 = ito->getOperand(0);
			Value *opO1 = ito->getOperand(1);

			errs() << "Old Initialization inner " << dyn_cast<ConstantInt>(opI0)->getValue() << "\n";
			errs() << "Old Initialization outer " << dyn_cast<ConstantInt>(opO0)->getValue() << "\n";
			
			Value *tempI0 = opI0;
			Value *tempI1 = opI1;
			Value *tempO0 = opO0;
			Value *tempO1 = opO1;

			if (opO1->getName() == opI1->getName())
			{
				iti->setOperand(0, tempO0);
				ito->setOperand(0, tempI0);
				iti->setOperand(1, tempO1);
				ito->setOperand(1, tempI1);
				opI0 = iti->getOperand(0);
				opO0 = ito->getOperand(0);
				opI1 = iti->getOperand(1);
				opO1 = ito->getOperand(1);
			
				errs() << "New Initialization inner " << dyn_cast<ConstantInt>(opI0)->getValue() << "\n";
				errs() << "New Initialization Outer " << dyn_cast<ConstantInt>(opO0)->getValue() << "\n";
			}
		}

		void swapHeader(BasicBlock *inHdr, BasicBlock *outHdr)
		{
			errs() << "In swap header\n";
			vector<Instruction *> cmpInstO;
			vector<Instruction *> cmpInstI;
			for (auto &Ii : *inHdr)
			{
				if (CmpInst *icmp = dyn_cast<CmpInst>(&Ii))
				{
					cmpInstI.push_back(&Ii);
				}
			}
			for (auto &Io : *outHdr)
			{
				if (CmpInst *icmp = dyn_cast<CmpInst>(&Io))
				{
					cmpInstO.push_back(&Io);
				}
			}
    			Instruction *itci = cmpInstI.back(); 
    			Instruction *itco = cmpInstO.back(); 
  
			Value *opcI0 = itci->getOperand(0);
			Value *opcI1 = itci->getOperand(1);
			Value *opcO0 = itco->getOperand(0);
			Value *opcO1 = itco->getOperand(1);

			errs() << "Old Header inner " << dyn_cast<ConstantInt>(opcI1)->getValue() << "\n";
			errs() << "Old Header outer " << dyn_cast<ConstantInt>(opcO1)->getValue() << "\n";
			
			Value *tempI0 = opcI0;
			Value *tempI1 = opcI1;
			Value *tempO0 = opcO0;
			Value *tempO1 = opcO1;

			if (opcO0->getName() == opcI0->getName())
			{
				itci->setOperand(0, tempO0);
				itco->setOperand(0, tempI0);
				itci->setOperand(1, tempO1);
				itco->setOperand(1, tempI1);
				opcI0 = itci->getOperand(0);
				opcO0 = itco->getOperand(0);
				opcI1 = itci->getOperand(1);
				opcO1 = itco->getOperand(1);
			
				errs() << "New Header Inner " << dyn_cast<ConstantInt>(opcI1)->getValue() << "\n";
				errs() << "New Header Outer " << dyn_cast<ConstantInt>(opcO1)->getValue() << "\n";
			}
				
		}

		void swapLatch(BasicBlock *inLatch, BasicBlock *outLatch)
		{
			errs() << "In swap latch\n";
			vector<Instruction *> latchInstO;
			vector<Instruction *> latchInstI;
			for (auto &Ii : *inLatch)
			{
				if (Ii.isBinaryOp())
				{
					latchInstI.push_back(&Ii);
				}
			}
			for (auto &Io : *outLatch)
			{
				if (Io.isBinaryOp())
				{
					latchInstO.push_back(&Io);
				}
			}
    			Instruction *itli = latchInstI.back(); 
    			Instruction *itlo = latchInstO.back(); 
  
			Value *oplI0 = itli->getOperand(0);
			Value *oplI1 = itli->getOperand(1);
			Value *oplO0 = itlo->getOperand(0);
			Value *oplO1 = itlo->getOperand(1);

			errs() << "Old Latch Inner " << dyn_cast<ConstantInt>(oplI1)->getValue() << "\n";
			errs() << "Old Latch Outer " << dyn_cast<ConstantInt>(oplO1)->getValue() << "\n";
			
			Value *tempI0 = oplI0;
			Value *tempI1 = oplI1;
			Value *tempO0 = oplO0;
			Value *tempO1 = oplO1;

			if (oplO0->getName() == oplI0->getName())
			{
				itli->setOperand(0, tempO0);
				itlo->setOperand(0, tempI0);
				itli->setOperand(1, tempO1);
				itlo->setOperand(1, tempI1);
				oplI0 = itli->getOperand(0);
				oplO0 = itlo->getOperand(0);
				oplI1 = itli->getOperand(1);
				oplO1 = itlo->getOperand(1);
			
				errs() << "New Latch Inner " << dyn_cast<ConstantInt>(oplI1)->getValue() << "\n";
				errs() << "New Latch Outer " << dyn_cast<ConstantInt>(oplO1)->getValue() << "\n";
			}
				
		}

		bool loop_interchange(Loop *outer, Loop *inner)
		{
			errs() << "In interchange\n";
			BasicBlock *inPre = inner->getLoopPreheader();
			BasicBlock *inHdr = inner->getHeader();
			BasicBlock *inLatch = inner->getLoopLatch();
			BasicBlock *outPre = outer->getLoopPreheader();
			BasicBlock *outHdr = outer->getHeader();
			BasicBlock *outLatch = inner->getLoopLatch();
							
			swappreHeader(inPre, outPre);
			swapHeader(inHdr, outHdr);
			swapLatch(inLatch, outLatch);	
	
			return false;
		}

		bool isUnsafe(BasicBlock *BB)
		{
			for (auto &I : *BB)
			{
				if (I.mayHaveSideEffects() || I.mayReadFromMemory())
				{
					return true;
				}
			}
			return false;
		}
		bool isPerfectlyNested(Loop *OuterLoop, Loop *InnerLoop)
		{
			BasicBlock *OuterLoopHeader = OuterLoop->getHeader();
			BasicBlock *InnerLoopPreHeader = InnerLoop->getLoopPreheader();
			BasicBlock *OuterLoopLatch = OuterLoop->getLoopLatch();
 
			int outerNum = OuterLoop->getNumBlocks();
			int innerNum = InnerLoop->getNumBlocks();

			return (outerNum - innerNum == 4);
		}

    		virtual bool runOnLoop(Loop *L, LPPassManager &LPM)
		{	
			vector<Value *> outerDefs, innerDefs;
			vector<Instruction *> *innerInst = new vector<Instruction *>();
			vector<Instruction *> *outerInst = new vector<Instruction *>();
			vector<Loop *> subLoops = L->getSubLoops();
			for (auto &l : subLoops)
			{
				outs() << get_loop_ID(L->getHeader()) << "\n";	
				outs() << get_loop_ID(l->getHeader()) << "\n";	
				if (isPerfectlyNested(L, l))
				{
					perf_nest++;
				
					Loop *innerLoop = l;
					Loop *outerLoop = L;
					BasicBlock *inPre = innerLoop->getLoopPreheader();
					BasicBlock *inHdr = innerLoop->getHeader();
					BasicBlock *inLatch = innerLoop->getLoopLatch();
					BasicBlock *Out = outerLoop->getHeader();
					for (auto &I : *Out)
					{
						if (LoadInst *LI = dyn_cast<LoadInst>(&I))
						{
							(*outerInst).push_back(&I);
						}
					}
					for (int it = 0; it < (*outerInst).size(); it++)
					{
						for (User::op_iterator i = ((*outerInst)[it])->op_begin(), e = ((*outerInst)[it])->op_end(); i != e; ++i)
						{
							Value *v = *i;
							outerDefs.push_back(v);	
						}
					}
					for (auto &I : *inPre)
					{
							(*innerInst).push_back(&I);
					}
					for (auto &I : *inHdr)
					{
							(*innerInst).push_back(&I);
					}
					for (auto &I : *inLatch)
					{
							(*innerInst).push_back(&I);
					}	
					for (int it = 0; it < (*outerInst).size(); it++)
					{
						for (User::op_iterator i = ((*outerInst)[it])->op_begin(), e = ((*outerInst)[it])->op_end(); i != e; ++i)
						{
							Value *v = *i;
							outerDefs.push_back(v);	
						}
					}
					for (int it = 0; it < (*innerInst).size(); it++)
					{
						for (User::op_iterator i = ((*innerInst)[it])->op_begin(), e = ((*innerInst)[it])->op_end(); i != e; ++i)
						{
							Value *v = *i;
							innerDefs.push_back(v);	
						}
					}

					outs() << "Found perfectly nested loops " << get_loop_ID(L->getHeader()) << " " << get_loop_ID(l->getHeader());
					int flag = 0;
					for (int it1 = 0; it1 < (outerDefs).size(); it1++)
					{
						for (int it2 = 0; it2 < (innerDefs).size(); it2++)
						{
							if ((innerDefs)[it2] == (outerDefs)[it1])
							{
								errs() << " Dependency found in this pair" << "\n";
								flag = 1;
								break;
							}
						}
						if (flag)
						{
							break;
						}
					}
					if (!flag)
					{
						errs() << "\nIndependent variables...";
						loop_interchange(L, l);
					}
				}
			}

			counter++;

		return false;
		}

		virtual bool doFinalization()
		{
			
			outs() << "Code has " << perf_nest << " perfectly nested loops\n";
			outs() << "Code has " << counter << " loops\n";	
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
