---
name: literature-survey
description: Use when reading, analyzing, or comparing research papers — triggered by PDF paths, arxiv links, paper titles, requests to survey a research area, or requests to understand a research paper. Covers architecture extraction, loss functions, ablations, dataset details, tensor shapes, component information flow, and connected work identification.
---

# Literature Survey & Synthesis

## Overview

A systematic method for extracting deep, structured understanding from research papers. Uses a four-pass dimension-driven approach with guiding questions to ensure completeness across all aspects of a paper: problem framing, architecture, training, and connected work.

**Core principle:** All 9 dimensions get maximum depth extraction on every paper. No light-pass mode. If information isn't available, explicitly state what's missing rather than silently skipping.

## When to Use

- User provides a PDF path, arxiv link, or paper title to analyze
- User asks to survey, summarize, or compare research papers
- User asks about a paper's architecture, training, or results
- User wants to identify related or connected work
- User wants to understand tradeoffs between approaches

## Input Resolution

Before extraction, resolve the paper into readable content:

**PDF in vault:**
- Read directly via the Read tool

**Arxiv link:**
- Fetch via the arxiv PDF URL (replace `/abs/` with `/pdf/`)
- If PDF fetch fails, try `/html/` as a fallback
- If the user wants to keep the paper, save to `Assets/`

**Paper title or topic:**
- WebSearch to find the paper (arxiv, Semantic Scholar, Google Scholar)
- Confirm the correct paper with the user before proceeding
- Then follow the arxiv link path

## The Four Extraction Passes

### Pass 1 — Framing (Problem, Data, Evaluation)

**Core Problem:**
- What specific limitation or gap in prior work does this paper address?
- What is the paper's thesis — the key claim about why their approach works?
- What assumptions does the paper make (about the domain, data availability, compute)?

**Dataset:**
- What datasets are used for training? For evaluation? Are they the same?
- What is the data modality (images, video, LiDAR, language, multi-modal)?
- What preprocessing or augmentation is applied?
- How large is the dataset (samples, hours, scenes)?
- Are there known limitations or biases in the dataset?
- What targets/labels does the method require beyond the raw dataset? Are any computed offline (e.g., simulation rollouts, pseudo-labels, distillation targets)? What is the compute/storage cost of generating these augmented targets?

**Evaluation:**
- What metrics are reported? How are they computed?
- What baselines are compared against?
- What are the headline quantitative results vs. prior SOTA?
- Are results on validation, test, or both? Open or closed leaderboard?
- Any evaluation methodology concerns (e.g., non-reactive simulation, train/val leakage)?

### Pass 2 — Architecture (Components, I/O, Information Flow)

**Inputs:**
- What are the abstract inputs to the full system (e.g., multi-view images, ego state, route)?
- What are the exact tensor shapes and representations at the model boundary (e.g., 6 cameras × 3×900×1600, ego state as 4D vector [x, y, yaw, v])?

**Components:**
- What are the major components/modules of the architecture? (e.g., backbone, neck, BEV encoder, decoder, scoring head)
- For each component:
  - What is its input and output (shapes when available)?
  - What computation does it perform (attention, convolution, MLP, diffusion step)?
  - What information or features does it extract or transform? What abstraction does it produce?
  - Why does this component exist? What problem or limitation (from the paper's motivation) does it address?
- How does information flow between components? What is communicated at each interface?
- Are any components pretrained, frozen, or shared?

**Key Design Choices:**
- What is novel about this architecture vs. prior work?
- Where does the paper deviate from standard approaches and why?
- Are there components inherited from prior work vs. newly introduced?

### Pass 3 — Training & Analysis (Losses, Ablations)

**Loss Functions:**
- What loss functions are used? Write out the mathematical formulation when provided.
- What does each loss term optimize for? How do they relate to the paper's stated goals?
- Are there weighting coefficients between losses? Are they tuned or fixed?
- Are any losses applied at intermediate stages (e.g., auxiliary losses on intermediate representations)?
- Are any losses novel to this paper vs. inherited from prior work?

**Ablations:**
- What ablation studies are reported?
- For each ablation: what was removed/changed, and what was the quantitative impact?
- Which design choices have **deep impact** (large metric change, affects multiple metrics) vs. **shallow impact** (small change, affects only one metric)?
- Are there ablations on loss weights, architecture components, training schedule, or data?
- Are there any surprising ablation results — things the authors expected to help but didn't, or vice versa?
- What is NOT ablated that you'd want to see tested?

### Pass 4 — Context (Connected Work)

**Prior Work (papers this work builds on):**
- What specific methods or components does this paper directly extend or modify?
- What papers share the same core idea in principle, even if applied to a different domain?
- Where does this paper position itself in its lineage (e.g., DETR → DAB-DETR → DN-DETR → DINO)?

**Concurrent & Future Work:**
- Are there concurrent papers solving the same problem with a different approach?
- What limitations does the paper acknowledge that future work might address?
- Based on the ablations and results, what natural next experiments or extensions suggest themselves?

**Cross-Domain Connections:**
- Does the core technique originate from another field (e.g., detection → planning, NLP → vision)?
- Are there analogous techniques in other domains that implement the same idea in principle but aren't cited?

**Searching for connected work:** Use subagents to search for and distill related papers in parallel — e.g., one subagent per key technique or lineage branch, each searching arxiv/Semantic Scholar and summarizing relevance back.

**Depth awareness:** Connected work discovery is inherently recursive — each related paper has its own related work. Stay anchored to the original paper's core contributions. Go one level deep on directly related methods (papers that share the same idea in principle), but do not chase references-of-references unless explicitly asked. Flag interesting deeper connections for the user to pursue rather than diving in.

## Behavioral Guardrails

**Figures and tables:** Papers encode critical information in architecture diagrams, training curves, and results tables. Read and interpret these — not just the prose.

**Supplementary material:** When available, supplementary/appendix sections often contain implementation details, additional ablations, and exact hyperparameters. Always check for these.

**No hallucinated details:** If the paper doesn't specify something (e.g., a tensor shape, a loss weight), say "not specified" rather than inferring. Distinguish between what the paper states and what can be reasonably inferred.
