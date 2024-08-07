#!/bin/zsh

TYPE=$(gum choose "🐛fix" "⚡️feat" "📝docs" "🎨style" "♻️refactor" "🚀perf" "🧪test" "🔧chore" "🗑️ revert" "⚒️ build")
SCOPE=$(gum input --placeholder "scope")

# Since the scope is optional, wrap it in parentheses if it has a value.
test -n "$SCOPE" && SCOPE="($SCOPE)"

# Pre-populate the input with the type(scope): so that the user may change it
SUMMARY=$(gum input --value "$TYPE$SCOPE: " --placeholder "Summary of this change")
DESCRIPTION=$(gum write --placeholder "Details of this change")

# Commit these changes if user confirms
gum confirm "Commit changes?" && git commit -m "$SUMMARY" -m "$DESCRIPTION"