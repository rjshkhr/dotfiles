function fish_prompt
       echo (set_color -o black)(set_color -b blue) (whoami)(set_color -b black)(set_color -o blue)(set_color -o white)(set_color -b brblack) (prompt_pwd)(set_color -b normal)(set_color -o black) (set_color -o normal)
end

function fish_right_prompt
   set -g __fish_git_prompt_show_informative_status 1
   set -g __fish_git_prompt_color_branch green -o
   set -g __fish_git_prompt_showupstream "informative"
   set -g __fish_git_prompt_showdirtystate "yes"
   set -g __fish_git_prompt_color_stagedstate magenta
   set -g __fish_git_prompt_color_invalidstate brred
   set -g __fish_git_prompt_color_cleanstate yellow
   set -g __fish_git_prompt_color_prefix cyan
   set -g __fish_git_prompt_color_suffix cyan
   set -g __fish_git_prompt_char_stateseparator ' '
   echo (__fish_git_prompt) (set_color normal)
 end
