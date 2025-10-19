# Delivery and Speaker Notes
Purpose: guide live delivery and timing.

## How to fill
- Use bullet points, not full sentences.
- Mark pauses, emphasis, and interactions.
- Include fallback options for demo or timing issues.

## Template
### Opening hook (prefer future or scenario form)
- "Imagine your first platform success creates a template you can't escape"
- "What if the 'right' decision today becomes the wrong constraint tomorrow?"
- PAUSE 2 seconds - let it land
- **Delivery note**: The hook isn't about avoiding patterns or success—it's about cognitive rigidity. Emphasize that the "template" is the *assumption* that what worked once will always work. The trap: auth centralization succeeded → storage must also be centralized. Don't explain this explicitly; let the story reveal it. The hook plants the question; Section 3 ("right for what?") answers it.

### Key points by section
1. **Opening + Context** (5 min, slides 1-7)
   - Hook: "template you can't escape" (cognitive rigidity, not anti-pattern)
   - Auth platform success story
   - **Keycloak deep dive**: multi-tenant Realms, Container Apps, Azure AD, external DB, Storage Account
   - NGINX reverse proxy for dual endpoints
   - Early lesson: over-engineered AD group-based auth → simplified
   - Pattern established: centralized control = success
   - Cross-reference: Session 3 "Portable PaaS Deployments with Azure Container Apps"

2. **The Build Decision** (6 min, slides 8-16)
   - **Discovery phase**: Teams already using MinIO (different versions, no visibility)
   - Hidden risks: black box operations, edge cases waiting
   - Insight: why not centralize what's already there?
   - Make vs Buy framework applied
   - Make wins: acquire competence + maintain control
   - MinIO chosen: teams already using it (de facto standard), S3-compatible, open source
   - **MinIO infrastructure**: S3 API + Console, stateless server, no DB, erasure coding, Azure storage
   - Initial deploy smooth (Week 1, 4, 8 progressive reveals)

3. **The Plateau** (8 min, slides 18-25) - CORE TECHNICAL NARRATIVE
   - **Deployment challenges**: dual ingress problem, NGINX reverse proxy, custom code risk
   - **Azure Files choice**: Standard tier assumption
   - **Performance degradation**: production load reveals bottlenecks
   - **Performance tuning journey**: RAM/CPU ✓, Disk I/O escalation (Standard→Premium→Ultra), cost increasing
   - **App abuse patterns**: recursive listings, uncached reads, unbatched operations
   - **Plan vs Reality**: charge teams vs absorbed cost (pressure)
   - **MinIO consistency checks**: continuous even at idle, heavy disk I/O
   - **The dangerous question**: disable consistency checks for 10x gain?
   - **The realization**: rabbit hole (custom config, understanding internals, unquantifiable risk)
   - This is where we stopped

4. **The Pivot Decision** (2 min, slides 26-27) - REVERSIBILITY PRINCIPLE
   - **Slide 26**: "What if we treated platform decisions as reversible?" (THE FOUNDATION)
   - Not permanent. Iterative.
   - **Slide 27**: Decision point - team/debt/business pressure
   - We needed to act fast
   - PAUSE: This is the principle connecting hook to buy phase

5. **The Buy Phase** (7 min, slides 28-32)
   - "Act fast, without breaking production, with low exit cost"
   - Not permanent. Reversible if needed.
   - Vendor selection criteria: S3 compatibility, zero downtime migration
   - Managed service transition
   - Business continuity maintained

6. **The Learning Year** (6 min, slides 33-37)
   - Team reorganizes: less ops, more governance
   - Hidden requirements now visible
   - Focus shifts: tech control → business needs discovery
   - "Governance scales, code doesn't"

7. **The Rebuild** (4 min, slides 38-41)
   - Return to internal with clarity
   - Definitive characteristics defined by production experience
   - Not failure → informed iteration

8. **Lessons + CTA** (4 min, slides 42-46)
   - Takeaway 1: Low exit costs > perfect decisions
   - Takeaway 2: Governance = business discovery
   - Takeaway 3: Iteration reveals truth
   - CTA: Identify one platform decision to treat as experiment

### Audience interaction
- Questions to ask: "Who's faced a platform decision that felt permanent?" (show of hands at Section 3)
- Demo moments: Show before/after architecture diagram (Section 4-5 transition)

### Closing / Call to action
- "This week: identify one platform choice you can make reversible"
- "Test your assumptions with low switching costs"
- "Iteration isn't indecision—it's strategic learning"

### Operational notes
- **Total slides**: 49 slides (0-48) including opening/feedback images
- **Content slides**: 47 slides (average 51 seconds per slide)
- Timing per section: 5/6/8/2/7/6/4/4 minutes (42 min total + 3 min buffer)
- Planned pauses: After opening hook (2s), after reversibility principle (3s), before CTA (2s)
- Backup plan: If running long, compress Section 1 to 3 min (Keycloak deep dive can be summarized faster)
- Follow-up materials: Framework diagram for make/buy/iterate decisions (can share as PDF or GitHub link)
- **Key structural change**: Reversibility principle made explicit (slides 26-27) as the unifying thread between opening hook and takeaways

## Checklist
- [x] Hook relevant for technical audience
- [x] 2–4 bullets per section max
- [x] At least one visible proof or demo
- [x] Clear CTA within 7 days
