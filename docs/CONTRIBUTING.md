# CONTRIBUTING.md
> [Return to README.md](../README.md)

**Thank you for deciding to read this document, perhaps with the intention of helping me develop this project, but I’m afraid I have to disappoint you - FOR NOW, I’M ONLY ACCEPTING HELP FROM PEOPLE I MYSELF DECIDE TO INCLUDE IN THE PROJECT, any other assistance will not be accepted**

Why did I decide this? This is an educational, non-commercial project, and the kernel itself will never be finished - so I don't intend to accept any financial or other assistance. Thank you for your understanding.

However, for those who will be working on this project with me, the rules that must be followed are outlined below.

## 1. Git branches
1) All branches must have a prefix:
- `dev/` - A branch for working on the code. Anything goes—adding new features, refactoring, fixing bugs—it’s all in this branch. A successful pull request from here triggers both GitHub Actions.
- `docs/` - A branch for updating documentation. If a pull request to the main branch is successful, it will not trigger GitHub Actions. `.gitignore`, `.gitattributes` and `shell.nix` are also updated in this category.
- `web/` - A branch for updating the project's website, where you can test the kernel. A successful pull request to the main branch from this branch triggers a GitHub Action designed to update the website.
- `ci/` - A branch for changes in GitHub Actions. When successfully merged into the main branch, it triggers all GitHub Actions.

2) The branch name should include a brief description of what is being done in it. For example, `dev/refactoring`.

## 2. Git commits
1) All commits must begin with an appropriate emoji from [this site](https://gitmoji.dev/). This serves no specific purpose, but it provides a slightly better understanding of what the commit does and makes the commit history more visually appealing.

2) A commit should include brief, concise information about what it adds. Commits that are too long are more of a hindrance than a help.

3) It is prohibited to generate commit titles using AI.

## 3. Code rules
1) The use of AI is permitted to create a quick prototype of a particular feature - for example, to try to figure out how something works - but its final version must always be written manually by a programmer.

2) For now, there won't be many code-related rules, since I'm the only developer at the moment