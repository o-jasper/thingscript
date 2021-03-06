#!/bin/bash
# Does tests/installs some things needed for some aspects of thingscript.
#Note: decided not to use Makefile in this case.

ROOTLIKE=/home/$USER/.thingscript_share/rootlike/

INIT_PWD=$PWD

export THINGSCRIPT_TESTY=yes #Make it testy.

run()
{   
    for which in $@; do
        echo Thingscript installer running: $which
        echo 
        cd $INIT_PWD
        case "$which" in
            node_modules) #Gets some node.js modules, contacts internet.
                if [ -e $ROOTLIKE/share/node_modules ]; then
                    exit
                fi
                cd $ROOTLIKE/share/
                npm install schema schema-validator ;; # Needed for validators.
            testpage_clean) #Scrubs the test page clean
                cd testpage
                rm -vindex.html one_thing.tracker.json summary.html pics/*.png
                rm -rv tso/ releases/ output/tso/ pics/tso/ thingscript/etc/tso/
                cd thingscript/ #Thingscript files defaulted.
                rm -v main_image thumbnail version uuid;;
            clean_test) #Test after cleaning.
                run testpage_clean test_prep test ;;
            gen_test_pics) #Generates the images of the test.
                cd testpage/pics/
                sh gen.sh ;;
            test_prep)
                run gen_test_pics ;;
            test_*)
                thingscript mk $(echo $which | cut -f 2- -d_) testpage/ ;;
            test)
                run test_page test_tracker test_summary test_release;;
            make)
                run node_modules ;;
            figure_version)
                git show |head -n 1 | cut -f 2 -d' ' > ~/.thingscript_share/main/thingscript_version;;
            gen-docs) #Generates the documentation.
                share/rootlike/bin/gen-doc-for.sh all share/physible/ ;;
            
            userlevel_install) #Places symlinks to install it at userlevel.
                cd ~/
                mkdir -p .bin .thingscript/main/
                ln -s $INIT_PWD/share/ ~/.thingscript_share
                mkdir -p ~/.bin/
                ln -s $INIT_PWD/bin/thingscript .bin/thingscript
              #Only works if `source install.sh userlevel_install` is used.
                export PATH=$PATH:~/.bin/ 
              #Get some stuff.
                run node_modules figure_version gen-docs
              #Notify user
                echo Recommend adding user author name > ~/.thingscript/main/author
                echo 'Recommend adding user author name in ~/.thingscript/main/author,'
                echo 'though it can be done on a per-thing basis.' ;;
            
            *)
                echo Couldnt find such installer/runner;;
        esac
    done
}

run $@
