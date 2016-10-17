
# Initialize glyphs to be used in the prompt.
set -q chain_prompt_glyph
  or set -g chain_prompt_glyph "»"
set -q chain_git_branch_glyph
  or set -g chain_git_branch_glyph "⎇"
set -q chain_git_dirty_glyph
  or set -g chain_git_dirty_glyph "±"
set -q chain_su_glyph
  or set -g chain_su_glyph "⚡"

function __chain_prompt_segment
  set_color $argv[1]
  echo -n -s "" $argv[2..-1] " "
  set_color normal
end

function __chain_git_branch_name
  echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function __chain_git_revision
  echo (command git show-ref --head -s --abbrev |head -n1 2> /dev/null)
end

function __chain_is_git_dirty
  echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function __svn_get_revision
  svn info 2> /dev/null | sed -n 's/Revision:\ //p'
end

function __svn_get_branch
  svn info 2> /dev/null | awk -F/ \
      '/^URL:/ { \
        for (i=0; i<=NF; i++) { \
          if ($i == "branches" || $i == "tags" ) { \
            print $(i+1); \
            break;\
          }; \
          if ($i == "trunk") { print $i; break; } \
        } \
      }'
end

function __chain_prompt_root
    __chain_prompt_segment yellow (hostname -s)": "
end

function __chain_prompt_dir
  __chain_prompt_segment magenta (pwd)
end

function __chain_prompt_git
  if test (__chain_git_branch_name)
    set -l git_branch (__chain_git_branch_name)
    set -l git_revison (__chain_git_revision)
    __chain_prompt_segment blue "$chain_git_branch_glyph  $git_branch#$git_revison"

    if test (__chain_is_git_dirty)
      __chain_prompt_segment yellow $chain_git_dirty_glyph
    end
  end
end

function __chain_prompt_svn
  if test (__svn_get_branch)
        set -l git_branch (__svn_get_branch)
        set -l git_revison (__svn_get_revision)
        __chain_prompt_segment blue "$chain_git_branch_glyph  $git_branch#$git_revison"
    end
end

function __chain_prompt_arrow
  if test $last_status = 0
    set_color yellow
  else
    set_color red
    echo -n "($last_status)-"
  end

  echo -n "$chain_prompt_glyph "
end

function fish_prompt
  set -g last_status $status
  # __chain_prompt_root
  __chain_prompt_dir
  type -q git; and __chain_prompt_git
  type -q svn; and __chain_prompt_svn
  # 
  __chain_prompt_arrow
  set_color normal
end
