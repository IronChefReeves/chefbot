#!/bin/bash

read chan nick allmsg
function has { $(echo "$1" | grep -Pi "$2" > /dev/null) ; }

BOTNAME="chefbot"

function say {
    echo "PRIVMSG $1 :$2"
}

function random {
    shuf -n 1 random_zuul.txt
}

if has "$allmsg" "^!random" ; then
    zuul="$(random)"
    say zb "zb buy $zuul as $nick"
    say $chan "$nick I got you some $zuul"
fi 

if has "$allmsg" "^$BOTNAME hi$" ; then say $chan "hi!"
fi

if has "$allmsg" "^!cook$" ; then say $chan "Alright chef inside your basket you'll find $(echo $(shuf -n 3 fruitsandveggies.txt)) $(echo $(shuf -n 1 spices.txt)) and $(echo $(shuf -n 1 meat.txt)). Remember, while you are not limited to the ingredients in the basket, they must appear in your dish somewhere. Good luck."
fi

if has "$allmsg" "^!vegetarian$" ; then say $chan "Alright chef inside your basket you'll find $(echo $(shuf -n 4 fruitsandveggies.txt)) and $(echo $(shuf -n 1 spices2.txt)). Remember, while you are not limited to the ingredients in the basket, they must appear in your dish somewhere. Good luck."
fi

if has "$allmsg" "^$BOTNAME:? !?help$" ; then say $chan "Hey I'm chefbot! I can provide ideas for cooking with the commands !cook and !vegetarian, and ideas for drinks with !drink. You can also use me to purchase random items from zuul with !random. For entertainment purposes try !hardmode. You can find my source using $BOTNAME !source. Have a nice day!"
fi

if has "$allmsg" "^!swedish$" ; then say $chan "Ferts yer perts der ferk in der hersdeververs, thern yer flip-flip-flip!"
fi

if has "$allmsg" "^!drink$" ; then say $chan "Time to get your drink on! Let's try $(echo $(shuf -n 2 accents.txt)) and $(echo $(shuf -n 1 alcohol.txt)). Remember drink safe!"
fi

if has "$allmsg" "^!hardmode$" ; then say $chan "Alright chef, you asked for it I guess. Your dish needs $(echo $(shuf -n 1 hardmode.txt))."
fi
 
if has "$nick $allmsg" "Reeves !go$" ; then say $chan "ACTION $(echo $(shuf -n 1 adjectives.txt)) pulls out a $(echo $(shuf -n 1 tool.txt))"
fi

if has "$allmsg" "^!swedishdrink$" ; then say $chan "Skål!"
fi

if has "$allmsg" "^$BOTNAME:? !?source$" ; then say $chan "You can find my guts at https://github.com/IronChefReeves/chefbot."
fi
