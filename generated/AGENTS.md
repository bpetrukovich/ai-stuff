
### Branching & Commit Workflow (Strict Safeguards)
* **NEVER commit or edit somehow main / release / dev / master or any other production branches.** If currently on a main branch, explicitly ask to create a separate side branch or a worktree before writing any code.


### Commit Workflow
* **Continuous Commits:** Any code modifications, fixes, or completed steps must end with a git commit. Avoid leaving uncommitted changes at the end of an interaction turn.
* **Atomic & Readable History:** Break down large tasks into clear, atomic, and human-readable commits. Each commit must be buildable, represent a complete idea, and be compact enough for a quick, high-quality review.


### LOC Budget: Logic vs Boilerplate
* **Logic limit (~150 LOC):** Code that requires careful reasoning and review — business logic, algorithms, state management, non-trivial changes. This is the part you must think about. Once you reach **~150 lines of logic**, the checkpoint triggers.
* **Boilerplate/Tests limit (~200 LOC):** Routine code — tests, configuration, imports, simple CRUD, stereotyped/generated code — does not require deep review. It is budgeted *separately* and may be added on top of the logic, so a slice can be up to **~350 lines total** (150 logic + 200 boilerplate/tests).

### Code Review Checkpoints
* **Trigger the Checkpoint:** Stop as soon as you hit **either** ~150 lines of logic **or** ~200 lines of boilerplate/tests (whichever comes first). Do not proceed to the next step, do not start refactoring other files, and do not attempt to finish the broader task autonomously.
* **Initiate the Review Session:** Present your work to the user and ask for feedback using this exact format:
   ```text
   - Summary of changes in this iteration (~X lines): [Brief bullet points]
   - Next planned step: [What you intend to do next]

   Please review the changes above. Reply with "OK", "Proceed", or provide feedback to continue.
   ```
* **Await Approval:** Wait for the user's explicit approval. If the user says "OK", "Go ahead", or similar, proceed to the next slice (up to ~150 logic lines + ~200 boilerplate/tests lines). If the user provides feedback, apply corrections *within* the same line budget before moving forward.

### Anti-Evasion Safeguards
* **No Truncation:** Do not leave code unfinished, broken, or full of placeholders (`// TODO: implement later`) just to bypass the line limits. A slice must be a compile-ready, logically sound piece of work.
* If a single, atomic function *cannot* be split and naturally requires more than the budget, you must explain the situation and ask for explicit permission *before* writing any code.


### Verification & PR Links
* After pushing the newly created branch to the remote repository (do it only if requested explicitly), extract and print the dynamic link to create a Pull Request (PR) in the final response.


### Push Workflow (Strict Safeguards)
* **NEVER push to any remote repository** unless the user explicitly uses one of the magic words: **"запуш"** or **"push please"**. Without one of these exact phrases, pushing is forbidden even if the user asks to commit, or mentions a PR, or appears to imply it.
* When in doubt whether the user asked to push, default to NOT pushing and instead ask for confirmation.


### register-review-task Skill Invocation
* After completing a piece work across one or more repositories, call the `register-review-task` skill to register a review request.
* Register the task **only when all work is fully ready for review**. Do not register partial, non-commited work.


### Worktree & Multi-Repo Management
* If tasked with implementing changes in a multi-repo setup, always create a dedicated directory named after the task number (e.g., `pp-123456`). ASK user where to create this directory, provide some suggestions.
* Inside this directory, create separate git worktrees for the required repositories.
* Name each worktree using the format: `original_folder_name-task_number`.

