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

5. **The Buy Phase** (9 min, slides 28-35)
   - "Act fast, without breaking production, with low exit cost"
   - **Vendor landscape**: Azure Blob, Oracle, third-party providers (visual grid)
   - **Selection criteria** (progressive reveal):
     • No egress fees (critical for reversibility)
     • Stable, certified pricing model
     • Lower cost than major cloud providers
     • Performance to be validated (trade-off acknowledged)
   - **Platform service philosophy**: 24/7 critical, N→10N client scaling, no maintenance windows
   - **Zero-downtime migration** (4-step visual):
     1. Identify usage points
     2. Prepare new environment (buckets)
     3. Active replication (MinIO feature)
     4. Switch service by service
   - **Switch process**: formal deprecation email, deadline, all teams migrated successfully
   - **Grace period**: MinIO stopped (not dismessed), 1-2 weeks, surface unknown clients, clean decommission

6. **The Learning Year** (7 min, slides 36-40)
   - **Slide 36**: "Why not go managed from day one?" - "Because we didn't know what we needed yet"
   - Build phase taught us: real workloads, bottlenecks, hidden requirements
   - During Build: learning domain, too busy to reflect
   - With Managed: informed selection, time to think
   - **Slide 37**: Platform as Product - clients see stability, team iterates (hidden)
   - **Slide 38**: Observation period - adoption grew, Data Platform teams (data lakes)
   - **Slide 39**: Data lake scenario - very high file count → performance issues (latency, throughput, listing), feature requests (logging, metrics, security, compliance)
   - **Slide 40**: Pattern emerges - Make v2 with ALL real requirements (initial + make + buy + production)

7. **The Rebuild** (5 min, slides 41-45)
   - **Slide 41**: Hybrid approach - software control (MinIO) + ops delegated (third party: servers, disks, RAID)
   - Bare metal decision (not public cloud) - disk-intensive performance
   - "Backbone of cloud without seeing it"
   - **Slide 42**: Switch v2 - painless migration, standardized endpoints + governance = no client notification needed
   - **Slide 43**: "How many times can we do this?" - existential question
   - **Slide 44**: "As many times as needed" - each iteration reveals truth
   - **Slide 45**: Build → Buy → Build v2 (Hybrid) - informed evolution, each phase added knowledge

8. **Lessons + CTA** (4 min, slides 46-51)
   - **Slide 46**: "What did we learn from this journey?"
   - **Slide 47** (Takeaway 1): Low exit costs enable learning faster than perfect decisions - reversibility beats correctness
   - **Slide 48** (Takeaway 2): Platform governance = business needs discovery, not just tech control
   - **Slide 49** (Takeaway 3): Governance scales, code doesn't - real platform is organizational capability
   - **Slide 50** (CTA): Identify one platform choice you can make reversible this week
   - **Slide 51**: Iteration isn't indecision—it's strategic learning

### Audience interaction
- Questions to ask: "Who's faced a platform decision that felt permanent?" (show of hands at Section 3)
- Demo moments: Show before/after architecture diagram (Section 4-5 transition)

### Closing / Call to action
- "This week: identify one platform choice you can make reversible"
- "Test your assumptions with low switching costs"
- "Iteration isn't indecision—it's strategic learning"

### Operational notes
- **Total slides**: 53 slides (0-52) including opening/feedback images
- **Content slides**: 51 slides (average 52 seconds per slide)
- Timing per section: 5/6/8/2/9/7/5/4 minutes (46 min total, no buffer - tight timing)
- Planned pauses: After opening hook (2s), after reversibility principle (3s), before CTA (2s)
- Backup plan: If running long, compress Section 1 to 3 min (Keycloak deep dive can be summarized faster)
- Follow-up materials: Framework diagram for make/buy/iterate decisions (can share as PDF or GitHub link)
- **Key structural change**: Reversibility principle made explicit (slides 26-27) as the unifying thread between opening hook and takeaways

## Checklist
- [x] Hook relevant for technical audience
- [x] 2–4 bullets per section max
- [x] At least one visible proof or demo
- [x] Clear CTA within 7 days
