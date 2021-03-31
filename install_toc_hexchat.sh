#!/usr/bin/env bash

CONF_DIR=~/.config/hexchat
CONFIG_FILE=$CONF_DIR/hexchat.conf
SERVER_FILE=$CONF_DIR/servlist.conf
COLORS_FILE=$CONF_DIR/colors.conf

set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'if [ $? -ne 0 ]; then echo "\"${last_command}\" command failed with exit code $?."; fi;' EXIT


installHexChat() {

if [ -x "$(command -v hexchat)" ]; then
   echo "HexChat is already installed.";
   exit;
fi

if [ -x "$(command -v apt)" ]; then
   sudo apt install -y hexchat; return;
elif [ -x "$(command -v pacman)" ]; then
   sudo pacman -S hexchat; return;
elif [ -x "$(command -v dnf)" ]; then
   sudo dnf install hexchat; return;
elif [ -x "$(command -v yum)" ]; then
   sudo yum install hexchat; return;
else
   echo "Error. No supported package manager found (apt/pacman/dnf/yum).";
   return 1;
fi

}

createServlist() {

if [ -e $SERVER_FILE ]; then
   echo "$SERVER_FILE file exists";
   return;
else
   cat > $SERVER_FILE << EOF
v=2.14.3

N=irc.shells.net (TOC)
E=UTF-8 (Unicode)
F=87
D=0
S=irc.shells.net/+6697

N=irc.shells.org (Rizon)
E=UTF-8 (Unicode)
F=119
D=0
S=irc.shells.org/+6697

N=freenode
L=6
E=UTF-8 (Unicode)
F=87
D=0
S=chat.freenode.net
S=irc.freenode.net

N=2600net
E=UTF-8 (Unicode)
F=19
D=0
S=irc.2600.net

N=2ch
E=iso-2022-jp
F=19
D=0
S=irc.2ch.sc
S=irc.nurs.or.jp
S=irc.juggler.jp

N=AccessIRC
E=UTF-8 (Unicode)
F=19
D=0
S=irc.accessirc.net

N=AfterNET
L=6
E=UTF-8 (Unicode)
F=23
D=0
S=irc.afternet.org

N=Aitvaras
E=UTF-8 (Unicode)
F=19
D=0
S=irc.data.lt/+6668
S=irc.omnitel.net/+6668
S=irc.ktu.lt/+6668
S=irc.kis.lt/+6668
S=irc.vub.lt/+6668
S=irc.data.lt
S=irc.omnitel.net
S=irc.ktu.lt
S=irc.kis.lt
S=irc.vub.lt

N=Anthrochat
E=UTF-8 (Unicode)
F=23
D=0
S=irc.anthrochat.net

N=ARCNet
E=UTF-8 (Unicode)
F=19
D=0
S=arcnet-irc.org

N=AustNet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.austnet.org

N=AzzurraNet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.azzurra.org

N=BetaChat
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.betachat.net

N=BuddyIM
L=6
E=UTF-8 (Unicode)
F=23
D=0
S=irc.buddy.im

N=Canternet
L=6
E=UTF-8 (Unicode)
F=23
D=0
S=irc.canternet.org

N=Chat4all
E=UTF-8 (Unicode)
F=23
D=0
S=irc.chat4all.org

N=ChatJunkies
E=UTF-8 (Unicode)
F=19
D=0
S=irc.chatjunkies.org

N=ChatNet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.chatnet.org

N=ChatSpike
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.chatspike.net

N=ChattingAway
E=UTF-8 (Unicode)
F=19
D=0
S=irc.chattingaway.com

N=Criten
E=UTF-8 (Unicode)
F=19
D=0
S=irc.criten.net

N=DALnet
L=2
E=UTF-8 (Unicode)
F=19
D=0
S=us.dal.net

N=DarkMyst
L=6
E=UTF-8 (Unicode)
F=23
D=0
S=irc.darkmyst.org

N=Dark-Tou-Net
E=UTF-8 (Unicode)
F=19
D=0
S=irc.d-t-net.de

N=DeltaAnime
E=UTF-8 (Unicode)
F=19
D=0
S=irc.deltaanime.net

N=EFnet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.choopa.net
S=irc.paraphysics.net
S=efnet.port80.se
S=irc.underworld.no
S=irc.inet.tele.dk

N=ElectroCode
L=6
E=UTF-8 (Unicode)
F=23
D=0
S=irc.electrocode.net

N=EnterTheGame
E=UTF-8 (Unicode)
F=19
D=0
S=irc.enterthegame.com

N=EntropyNet
L=6
E=UTF-8 (Unicode)
F=23
D=0
S=irc.entropynet.net

N=EsperNet
L=6
E=UTF-8 (Unicode)
F=23
D=0
S=irc.esper.net

N=EUIrc
E=UTF-8 (Unicode)
F=19
D=0
S=irc.euirc.net

N=EuropNet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.europnet.org

N=FDFNet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.fdfnet.net

N=GalaxyNet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.galaxynet.org

N=GameSurge
E=UTF-8 (Unicode)
F=19
D=0
S=irc.gamesurge.net

N=GeeksIRC
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.geeksirc.net

N=GeekShed
E=UTF-8 (Unicode)
F=23
D=0
S=irc.geekshed.net

N=German-Elite
E=CP1252
F=19
D=0
S=irc.german-elite.net

N=GIMPNet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.gimp.org
S=irc.gnome.org

N=GlobalGamers
E=UTF-8 (Unicode)
F=19
D=0
S=irc.globalgamers.net/+6660
S=irc.globalgamers.net

N=hackint
L=6
E=UTF-8 (Unicode)
F=23
D=0
S=irc.hackint.org

N=Hashmark
E=UTF-8 (Unicode)
F=19
D=0
S=irc.hashmark.net

N=IdleMonkeys
E=UTF-8 (Unicode)
F=19
D=0
S=irc.idlemonkeys.net

N=IndirectIRC
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.indirectirc.com

N=Interlinked
L=6
E=UTF-8 (Unicode)
F=23
D=0
S=irc.interlinked.me

N=IRC4Fun
L=6
E=UTF-8 (Unicode)
F=23
D=0
S=irc.irc4fun.net

N=IRCHighWay
E=UTF-8 (Unicode)
F=23
D=0
S=irc.irchighway.net

N=IRCNet
E=UTF-8 (Unicode)
F=19
D=0
S=open.ircnet.net

N=Irctoo.net
E=UTF-8 (Unicode)
F=19
D=0
S=irc.irctoo.net

N=iZ-smart.net
E=CP1252
F=19
D=0
S=irc.iz-smart.net

N=KBFail
E=UTF-8 (Unicode)
F=19
D=0
S=irc.kbfail.net

N=Krstarica
E=UTF-8 (Unicode)
F=19
D=0
S=irc.krstarica.com

N=LibraIRC
E=UTF-8 (Unicode)
F=19
D=0
S=irc.librairc.net

N=LinkNet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.link-net.org/+7000

N=MindForge
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.mindforge.org

N=MIXXnet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.mixxnet.net

N=Moznet
E=UTF-8 (Unicode)
F=23
D=0
S=irc.mozilla.org

N=ObsidianIRC
E=UTF-8 (Unicode)
F=19
D=0
S=irc.obsidianirc.net

N=Oceanius
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.oceanius.com

N=OFTC
E=UTF-8 (Unicode)
F=23
D=0
S=irc.oftc.net

N=OtherNet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.othernet.org

N=OzNet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.oz.org

N=PIRC.PL
E=UTF-8 (Unicode)
F=23
D=0
S=irc.pirc.pl

N=PonyChat
L=6
E=UTF-8 (Unicode)
F=23
D=0
S=irc.ponychat.net

N=PTNet.org
E=UTF-8 (Unicode)
F=19
D=0
S=uevora.ptnet.org
S=vianetworks.ptnet.org

N=QuakeNet
L=8
E=UTF-8 (Unicode)
F=19
D=0
S=irc.quakenet.org

N=Rizon
E=UTF-8 (Unicode)
F=23
D=0
S=irc.rizon.net

N=RusNet
E=KOI8-R (Cyrillic)
F=19
D=0
S=irc.tomsk.net
S=irc.run.net
S=irc.ru
S=irc.lucky.net

N=SceneNet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.scene.org

N=SeilEn.de
E=CP1252
F=19
D=0
S=irc.seilen.de

N=Serenity-IRC
E=UTF-8 (Unicode)
F=19
D=0
S=irc.serenity-irc.net

N=SlashNET
E=UTF-8 (Unicode)
F=19
D=0
S=irc.slashnet.org

N=Snoonet
L=6
E=UTF-8 (Unicode)
F=23
D=0
S=irc.snoonet.org

N=Sohbet.Net
E=CP1254
F=19
D=0
S=irc.sohbet.net

N=SolidIRC
E=UTF-8 (Unicode)
F=19
D=0
S=irc.solidirc.com

N=SorceryNet
L=6
E=UTF-8 (Unicode)
F=19
D=0
S=irc.sorcery.net

N=SpotChat
L=6
E=UTF-8 (Unicode)
F=23
D=0
S=irc.spotchat.org

N=StarChat
E=UTF-8 (Unicode)
F=19
D=0
S=irc.starchat.net

N=Station51
E=UTF-8 (Unicode)
F=19
D=0
S=irc.station51.net

N=StormBit
L=6
E=UTF-8 (Unicode)
F=23
D=0
S=irc.stormbit.net

N=SwiftIRC
E=UTF-8 (Unicode)
F=19
D=0
S=irc.swiftirc.net

N=synIRC
E=UTF-8 (Unicode)
F=19
D=0
S=irc.synirc.net

N=Techtronix
L=6
E=UTF-8 (Unicode)
F=23
D=0
S=irc.techtronix.net

N=TURLINet
E=UTF-8 (Unicode)
F=23
D=0
S=irc.servx.ru

N=UnderNet
L=9
E=UTF-8 (Unicode)
F=19
D=0
S=us.undernet.org
C=MSG x@channels.undernet.org login %u %p

N=UniBG
L=9
E=CP1251
F=19
D=0
S=irc.lirex.com
S=irc.naturella.com
S=irc.techno-link.com
C=MSG NS IDENTIFY %p

N=Worldnet
E=UTF-8 (Unicode)
F=19
D=0
S=irc.worldnet.net

N=Xertion
L=6
E=UTF-8 (Unicode)
F=23
D=0
S=irc.xertion.org
EOF
fi

}

createConf() {

if [ -e $CONFIG_FILE ]; then
   echo "$CONFIG_FILE file exists";
   return;
else
   cat > $CONFIG_FILE << EOF
gui_slist_fav = 1
irc_hide_version = 1
EOF
fi

}

createTheme() {

if [ -e $COLORS_FILE ]; then
   echo "$COLORS_FILE file exists";
   return;
else
   echo "Install Dark Theme?"
   select yn in "Yes" "No"; do
      case $yn in
         Yes ) cat > $COLORS_FILE << EOF
color_0 = ffff ffff ffff
color_1 = 1c1c 1c1c 1c1c
color_2 = 8f8f afaf d7d7
color_3 = 5f5f 8787 5f5f
color_4 = afaf 5f5f 5f5f
color_5 = 8787 8787 5f5f
color_6 = 5f5f 5f5f 8787
color_7 = bdbd 9122 5edf
color_8 = cccc cccc 8c8c
color_9 = 8787 afaf 8787
color_10 = 5f5f 8787 afaf
color_11 = 5f5f afaf afaf
color_12 = 5f5f 8787 8787
color_13 = 8787 8787 afaf
color_14 = 6b6b 6b6b 6b6b
color_15 = 9999 9999 9999
color_16 = ffff ffff ffff
color_17 = 1c1c 1c1c 1c1c
color_18 = 8f8f afaf d7d7
color_19 = 5f5f 8787 5f5f
color_20 = afaf 5f5f 5f5f
color_21 = 8787 8787 5f5f
color_22 = 5f5f 5f5f 8787
color_23 = bdbd 9122 5edf
color_24 = cccc cccc 8c8c
color_25 = 8787 afaf 8787
color_26 = 5f5f 8787 afaf
color_27 = 5f5f afaf afaf
color_28 = 5f5f 8787 8787
color_29 = 8787 8787 afaf
color_30 = 6b6b 6b6b 6b6b
color_31 = 9999 9999 9999
color_256 = f8f8 f8f8 f2f2
color_257 = 4949 4848 3e3e
color_258 = bcbc bcbc bcbc
color_259 = 2626 2626 2626
color_260 = cccc cccc 8c8c
color_261 = bdbd 9122 5edf
color_262 = 8787 afaf 8787
color_263 = 5f5f afaf afaf
color_264 = 9999 9999 9999
color_265 = afaf 5f5f 5f5f
EOF
break;;
         No ) break;;
      esac
done
fi
}


echo "Install HexChat?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) installHexChat; break;;
        No ) exit;;
     esac
done


mkdir -p $CONF_DIR;

createServlist;
createConf;
createTheme;

echo "Done.";
