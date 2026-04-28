# promts

Reusable prompt templates for a workflow where:

- Codex acts as senior planner and reviewer.
- A local Ollama model acts as the executor.
- Tasks are split to fit limited context.

## What to use first

- `codex_planner.md` for planning a project.
- `project_intake.md` for quick repo inspection.
- `task_template.md` for one atomic local task.
- `local_executor.md` for the local model prompt.
- `review_gate.md` for Codex review after the local run.

## Recommended local agent runtime

Use Aider with Ollama:

```bash
cd /path/to/project
export OLLAMA_API_BASE=http://127.0.0.1:11434
/home/maks/.local/bin/aider --model ollama_chat/codegeex4:9b
```

Backup model:

```bash
/home/maks/.local/bin/aider --model ollama_chat/qwen2.5-coder:7b
```

## One-command launcher

From this repo:

```bash
./launch_local_agent.sh [model] [project_dir]
```

Examples:

```bash
./launch_local_agent.sh
./launch_local_agent.sh ollama_chat/qwen2.5-coder:7b ~/Documents/some-project
```

Defaults:

- model: `ollama_chat/codegeex4:9b`
- project dir: current directory
- OLLAMA API base: `http://127.0.0.1:11434`

## Workflow

1. Ask Codex to inspect the repo and generate a small plan.
2. Split the plan into atomic tasks.
3. Put each task into a short task file.
4. Run one task through the local executor.
5. Verify the diff or file changes.
6. Give the result back to Codex for review.

## Notes

- Do not feed the whole repo into the local model.
- Keep one task per prompt.
- Prefer unified diffs or minimal file edits.
- Keep context small and deterministic.

