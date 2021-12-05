#! /bin/sh
set -e

latest_homebrew()
{
    # https://brew.sh/
    if [[ $(command -v brew) == "" ]]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        brew update --quiet
    fi
}

latest_formulas()
{

    [ -f "./formulas" ] && cat "./formulas" | xargs brew install --quiet
}

latest()
{
   latest_homebrew
   latest_formulas
}
