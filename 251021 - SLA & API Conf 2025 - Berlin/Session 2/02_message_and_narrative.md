# Message and Narrative
Purpose: define the key idea, takeaways, and story logic.

## How to fill
- Write one main message (max 20 words).
- Define 2–3 takeaways.
- Choose a narrative arc: Problem → Tension → Solution → Impact.
- Add evidence or stories supporting each takeaway.

## Template
- Core message: Iteration between build, buy, and managed services reveals strategic clarity better than trying to decide correctly upfront
- Key takeaways:
  1. Low exit costs enable learning faster than perfect decisions (reversibility beats correctness)
  2. Platform governance is about business needs discovery, not just technology control
  3. Governance scales, code doesn't (the real platform is organizational capability)
- Narrative structure:
  - Problem: Multiple development teams have common needs (auth, storage), but decisions feel permanent and high-stakes
  - Tension / Why now: First platform success (auth) creates pressure to replicate, but storage reveals complexity when "build for control" plateaus after 3 months
  - Solution / Idea: Treat platform decisions as iterative experiments—build to learn, buy to sustain, rebuild with clarity
  - Impact / Outcome: Team reorganizes with deep understanding of hidden requirements and business governance (not just tech)
- **Opening hook explanation**: The opening hook ("Imagine your first platform success creates a template you can't escape") establishes cognitive constraint as the core tension. It's NOT anti-pattern or anti-success—it's about the trap of applying a proven solution (centralized auth) to a different problem (storage) without questioning context fit. The "template" becomes a prison when success creates the assumption that the same approach will always work. This sets up the MinIO story: auth centralization succeeded, so storage centralization seemed obvious—until production revealed the mismatch.
- Supporting evidence (data, story, demo): Complete MinIO journey: Build phase (discovery of teams already using MinIO, 3-month operational phase revealing deployment challenges, Azure Files tier escalation, app abuse patterns, MinIO consistency checks dilemma), Buy phase (vendor selection with no egress fees for reversibility, zero-downtime migration with 4-step strategy, platform-as-product philosophy, grace period decommission), Learning Year (data lake scenario emergence, feature requests accumulation, "why not go managed from day one?" answered), Rebuild phase (hybrid approach combining software control with delegated operations, bare metal for disk-intensive performance, seamless switch v2 without client notification). Demonstrates complete cycle: Build → Buy → Build v2 (Hybrid) as informed evolution where each phase revealed hidden requirements and organizational learning that code alone couldn't scale.

## Checklist
- [x] Message understandable to non-experts
- [x] 2–3 actionable takeaways
- [x] Clear story progression (cause → effect)
- [x] At least one concrete example
