# Talk Script
Purpose: Write the complete talk narrative before creating slides.

## Session 2: Platform Engineering Beyond Build-vs-Buy - The MinIO Case Study

---

**Section 1: Opening & Context (5 minutes)**

**[Opening Hook – 1 min]**
"Imagine your first platform success creates a template you can't escape."

PAUSE 2 seconds - let the discomfort land.

"What if the 'right' decision today becomes the wrong constraint tomorrow?"

PAUSE 2 seconds.

---

**[Context Setting – 2 min]**
"Our platform journey started well. We had just shipped an authentication platform—deployed, working, teams were happy. It was a centralized solution, and it worked perfectly. Pattern established: centralized control equals success."

"So naturally, when storage became the next need, we thought: this should be easy. We'll apply the same framework. Make versus buy. We'll evaluate, we'll decide, we'll deploy. Simple."

Show quick auth metrics if time permits.

---

**[Transition – 2 min]**
"Auth worked. So we thought storage would be easy..."

PAUSE - let the irony settle.

---

**Section 2: The Build Decision (6 minutes)**

**[Discovery Phase – 2 min]**
"Before we made any decision, we listened to teams. And we discovered something interesting."

"Multiple teams needed object storage. No centralized offering. No external vendor approved. So they solved it themselves."

"Team A: MinIO in their stack. Team B: MinIO, different version. Team C: Custom S3 abstraction... wrapping MinIO."

PAUSE - let the pattern register.

"Same solution, replicated everywhere. Different versions. Black box operations. No visibility into edge cases."

"The insight hit us: why not extract MinIO from all these stacks and make it a platform?"

---

**[Make vs Buy Framework – 1 min]**
"So we applied the make-versus-buy framework. And the answer was clear: make wins."

"Teams were already using it—de facto standard. S3-compatible API. Open source. We could learn and maintain control."

---

**[MinIO Infrastructure – 1 min]**
"MinIO's architecture is elegant: S3 API plus web console. Stateless server—no external database. Metadata lives with the objects. Erasure coding for protection. Multi-node clustering for HA. Backed by Azure storage."

"Simple. Proven. Battle-tested by our own teams."

---

**[Early Win – 2 min]**
"Week one: deployed. Smooth. Week four: teams migrating. Week eight: production workloads running."

"Everything was going according to plan."

EMPHASIZE: "according to plan"

---

**Section 3: The Plateau (8 minutes) - CORE TECHNICAL NARRATIVE**

**[Deployment Challenges – 1 min]**
"First challenge: MinIO has dual endpoints—S3 API and web console. But Azure Container Apps doesn't support dual ingress."

"Our solution: NGINX reverse proxy. Custom code on top of MinIO. Every line of code we write, we must maintain. Did we cover all edge cases?"

"But it worked. The solution seemed solid."

---

**[Storage Backend Choice – 1 min]**
"Next: storage backend. We chose Azure Files. Multiple tiers. Managed service. We assumed Standard tier would be good enough."

"Then teams started using it in production..."

---

**[Performance Issues – 1 min]**
"Performance degradation. 'Why is storage so slow?'"

"Teams were happy with the centralized service. But production load revealed bottlenecks. Time to optimize."

---

**[The Tuning Rabbit Hole – 2 min]**
"We tuned RAM and CPU. Found optimal parameters. Check."

"Disk I/O optimization. Azure Files tier escalation: Standard to Premium to Ultra. Cost increasing..."

PAUSE.

"Then we realized: the real problem was application behavior."

"Recursive folder listings. Uncached reads. Operations that should be batched. Apps written assuming ephemeral, 'free' local storage."

---

**[Plan vs Reality – 1 min]**
"Our plan: increase performance, charge teams, teams optimize, everyone wins."

"Reality: we increased performance... but no time to wait. Pressure now. We absorbed the cost."

"We knew this would happen. We chose speed over optimization."

---

**[MinIO's Hidden Behavior – 1 min]**
"Then we discovered: MinIO does continuous consistency checks. Even at idle. Heavy disk I/O."

"Why? It assumes underlying storage might be unreliable. But Azure Files is already reliable... do we need this?"

---

**[The Dangerous Question – 1 min]**
"What if we disable consistency checks?"

PAUSE 2 seconds.

"Potential 10x performance gain."

PAUSE 2 seconds.

"But..."

---

**[The Realization – 1 min]**
"Changing MinIO's default behavior means going down a deep rabbit hole. Custom configuration to maintain. Understanding internals we didn't plan to own. Risk we couldn't quantify."

"This is where we realized: we need to stop and rethink."

---

**Section 4: The Pivot Decision (2 minutes) - REVERSIBILITY PRINCIPLE**

**[The Principle – 1 min]**
"What if we treated platform decisions as reversible?"

PAUSE 3 seconds. Let this breathe.

"Not permanent. Iterative."

---

**[Decision Point – 1 min]**
"Team stretched thin. Operations consuming innovation. Technical debt growing. Business blocked."

"We needed to act fast."

---

**Section 5: The Buy Phase (7 minutes)**

**[Act Fast with Low Exit Cost – 2 min]**
"Act fast, without breaking production, with low exit cost."

PAUSE.

"Not permanent. Reversible if needed."

"We pivoted to a managed service. Not because we failed. Because we needed breathing room to learn what we actually needed."

---

**[Selection Criteria – 2 min]**
"What did we look for? S3 compatibility—so we could migrate without rewriting every integration. Zero downtime migration path. Operational maturity—someone who'd solved these problems at scale already."

"And we found it. The transition was seamless."

---

**[The Switch – 2 min]**
"The migration itself? Smooth. No production impact. Teams barely noticed. The vendor handled all the operational overhead we'd been drowning in."

"And suddenly—breathing room."

---

**[Breathing Room Quote – 1 min]**
"Now we had breathing room to understand what we really needed..."

PAUSE. This is the turning point.

---

**Section 6: The Learning Year (6 minutes)**

**[The Shift – 2 min]**
"With operational pressure off, something interesting happened. The team reorganized."

"Before: reactive firefighting mode. After: strategy-focused, proactive planning. We shifted from tech control to business governance."

Show the before/after comparison if using slides.

---

**[Team Evolution – 2 min]**
"Less operational overhead meant more time for requirements discovery. We stopped asking 'how do we keep this running?' and started asking 'what do we actually need?'"

"Focus shifted from tech specs to business needs. That's when the hidden requirements became visible."

---

**[What We Learned – 2 min]**
"Cost patterns across teams. Actual compliance requirements—not assumed ones. Regional data sovereignty needs we'd never documented. Integration patterns with other platforms."

"Production experience revealed the truth."

---

**Section 7: The Rebuild (4 minutes)**

**[Key Insight Quote – 1 min]**
"And that's when we realized: governance scales, code doesn't."

PAUSE 2 seconds after this. It's the core insight.

"The real platform isn't the infrastructure. It's the organizational capability to understand what you need."

---

**[With Clarity – 1 min]**
"With clarity, we could rebuild properly..."

---

**[Return to Internal – 1 min]**
"So we did. We returned to an internal solution. But this time, we weren't building based on assumptions. We were building with knowledge."

"Exact performance requirements. Real compliance needs. Cost optimization strategies. A business governance framework—not just technical control."

---

**[Not Failure – 1 min]**
"Build, buy, build. Not failure. Informed iteration."

EMPHASIZE: "informed iteration"

"Each phase had value. Build: learn the problem space. Buy: sustain the business while discovering requirements. Rebuild: optimize with clarity."

---

**Section 8: Lessons & Call to Action (4 minutes)**

**[Transition – 30 sec]**
"What did we learn from this journey?"

---

**[Takeaway 1 – 1 min]**
"First: short-term decisions with low exit costs enable faster learning than long-term 'correct' choices."

"Reversibility beats correctness. S3 compatibility meant we could pivot without rewriting everything. That's not indecision—that's strategic optionality."

---

**[Takeaway 2 – 1 min]**
"Second: platform governance is about business needs discovery, not just technology control."

"The team managing a vendor with deep business understanding is more valuable than a larger team managing infrastructure without it."

---

**[Takeaway 3 – 1 min]**
"Third: rebuilding after buying isn't failure—it's informed iteration with real requirements."

"Planning reveals assumptions. Production reveals truth. Iteration closes the gap."

---

**[Call to Action – 30 sec]**
"This week: identify one platform choice you can make reversible."

"Test your assumptions with low switching costs. Don't try to decide perfectly—decide iteratively."

PAUSE 2 seconds.

---

**[Final Message – 30 sec]**
"Iteration isn't indecision. It's strategic learning."

Let that breathe for 4 seconds before transitioning to thank you / Q&A.

---

## Timing Validation

| Section | Planned Time | Actual Word Count | Est. Speaking Time |
|---------|--------------|-------------------|---------------------|
| Opening & Context | 5 min | ~300 words | 5 min |
| Build Decision | 6 min | ~400 words | 6 min |
| The Plateau | 8 min | ~600 words | 8 min |
| Pivot Decision | 2 min | ~100 words | 2 min |
| Buy Phase | 7 min | ~420 words | 7 min |
| Learning Year | 6 min | ~360 words | 6 min |
| Rebuild | 4 min | ~240 words | 4 min |
| Lessons & CTA | 4 min | ~240 words | 4 min |
| **Total** | **42 min** | **~2660 words** | **42 min** |

Buffer: 3 minutes for Q&A

**Note**: Added explicit "Pivot Decision" section (Section 4, slides 26-27) to establish reversibility principle as the narrative foundation connecting opening hook to buy phase and final takeaways.

---

## Key Moments

- **Opening hooks**: Two questions that create tension (2s pause each)
- **Discovery phase pattern**: Let "same solution, replicated everywhere" register before explaining
- **Deployment challenges**: Emphasize "custom code" risk—every line must be maintained
- **The tuning rabbit hole**: Build tension through Azure Files tier escalation before revealing app behavior
- **The dangerous question**: "What if we disable consistency checks?" with 2s pause, then "10x gain" pause, then "But..."
- **Reversibility principle**: 3-second pause after "What if we treated platform decisions as reversible?"—THIS IS THE FOUNDATION
- **"Governance scales, code doesn't"**: 2-second pause—core insight
- **Final message**: 4-second pause before closing

---

## Notes

- Keep pacing conversational (150 words/min average)
- Use concrete numbers where possible (Week 1/4/8, Standard→Premium→Ultra, 10x gain)
- Technical depth without over-explaining: Keycloak Realms, NGINX reverse proxy, MinIO consistency checks, Azure Files tiers
- Emphasize "reversibility" as the unifying thread: low exit cost enables iteration
- Build tension in Plateau section: each problem solution reveals deeper problem
- The "dangerous question" (disable consistency checks) is the moment of realization
- Frame iteration as strategic learning, not indecision

---

**Last updated**: 2025-10-19
**Status**: Aligned with finalized slide structure (49 slides including opening/feedback images, 47 content slides)
