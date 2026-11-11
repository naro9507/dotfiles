#!/bin/zsh

# Claude Code プラグインの導入
# claude CLI が無い環境（CI など）ではスキップする
if ! command -v claude &>/dev/null; then
  echo "claude CLI not found. Skipping Claude Code plugin setup."
  exit 0
fi

# marketplace 名 → GitHub リポジトリ
typeset -A marketplaces=(
  bamboo-nova-ja-tools bamboo-nova/meiseki
)

# plugin@marketplace
plugins=(
  meiseki@bamboo-nova-ja-tools # 日本語の明晰化・校正（textlint 同梱、Node.js 必須）
)

for name repo in ${(kv)marketplaces}; do
  if claude plugin marketplace list 2>/dev/null | grep -q "${name}"; then
    claude plugin marketplace update "${name}"
  else
    claude plugin marketplace add "${repo}"
  fi
done

for plugin in ${plugins[@]}; do
  claude plugin install "${plugin}"
done
