
module Keymap.CustomDvorak
    ( customDvorakKeymap
    , customDvorak
    ) where

import State
import qualified Data.Vector as V
import Data.Default
--
import KeySymbolDefinitions

customDvorak :: State
customDvorak = def { sKeymap = keyCodeAndGroupsToKeymap customDvorakKeymap
                   , sOnKey = customDvorakOnKey
                   , sLevel = shiftIsLevelTwo
                   }

customDvorakOnKey :: KeySymbol -> Either ModifierMap KeySymbol
customDvorakOnKey XK_Control_L = Left (ModifierMap XK_Control_L Control (updateModifiers XK_Control_L Control))
customDvorakOnKey k  = Right k

-- use the below commands:
-- xkbcomp :0 /tmp/server-0.xkb
--   get the keycodes to a file /tmp/keycodes.txt
--   and the list of keysyms to a file /tmp/keysyms.txt
--   from /tmp/keysyms.txt, join all lines between { } using the command
--   awk '/\{[^}]*$/ { line = $0; while (getline && !/}/) line = line $0; $0 = line "}" } { print }' /tmp/keysyms.txt >| /tmp/keysyms-modified.txt
--   for f in $(cat /tmp/keycodes.txt | sed --expression="s/\(<.*>\) = .*/\1/"); do grep "${f}" /tmp/keysyms-modified.txt | tr -d '\n' | sed --expression="s/.*= \(.*\);.*\(\[.*\]\).*/,(\1, V.fromList \2)/" ; echo "\r"; done >| /tmp/parsed-keymap.txt
customDvorakKeymap :: [(Int,Group)]
customDvorakKeymap =  [
     (9, group [          XK_Escape ])
    ,(10, group [               XK_1,          XK_exclam ])
    ,(11, group [               XK_2,              XK_at ])
    ,(12, group [               XK_3,      XK_numbersign ])
    ,(13, group [               XK_4,          XK_dollar ])
    ,(14, group [               XK_5,         XK_percent ])
    ,(15, group [               XK_6,     XK_asciicircum, XK_dead_circumflex, XK_dead_circumflex ])
    ,(16, group [               XK_7,       XK_ampersand ])
    ,(17, group [               XK_8,        XK_asterisk ])
    ,(18, group [               XK_9,       XK_parenleft,      XK_dead_grave,        XK_NoSymbol ])
    ,(19, group [               XK_0,      XK_parenright ])
    ,(20, group [     XK_bracketleft,       XK_braceleft ])
    ,(21, group [    XK_bracketright,      XK_braceright,      XK_dead_tilde,        XK_NoSymbol ])
    ,(22, group [       XK_BackSpace,       XK_BackSpace,        XK_NoSymbol,        XK_NoSymbol, XK_Terminate_Server ])
    ,(23, group [             XK_Tab,    XK_ISO_Left_Tab ])
    ,(24, group [      XK_apostrophe,        XK_quotedbl,      XK_dead_acute,  XK_dead_diaeresis ])
    ,(25, group [           XK_comma,            XK_less,    XK_dead_cedilla,      XK_dead_caron ])
    ,(26, group [          XK_period,         XK_greater,   XK_dead_abovedot,  XK_periodcentered ])
    ,(27, group [               XK_p,               XK_P ])
    ,(28, group [               XK_y,               XK_Y ])
    ,(29, group [               XK_f,               XK_F ])
    ,(30, group [               XK_g,               XK_G ])
    ,(31, group [               XK_c,               XK_C ])
    ,(32, group [               XK_r,               XK_R ])
    ,(33, group [               XK_l,               XK_L ])
    ,(34, group [           XK_slash,        XK_question ])
    ,(35, group [           XK_equal,            XK_plus ])
    ,(36, group [          XK_Return ])
    ,(37, group [       XK_Caps_Lock ])
    ,(38, group [               XK_a,               XK_A ])
    ,(39, group [               XK_o,               XK_O ])
    ,(40, group [               XK_e,               XK_E ])
    ,(41, group [               XK_i,               XK_I ])
    ,(42, group [               XK_u,               XK_U ])
    ,(43, group [               XK_d,               XK_D ])
    ,(44, group [               XK_h,               XK_H ])
    ,(45, group [               XK_t,               XK_T ])
    ,(46, group [               XK_n,               XK_N ])
    ,(47, group [               XK_s,               XK_S ])
    ,(48, group [           XK_minus,      XK_underscore ])
    ,(49, group [           XK_grave,      XK_asciitilde,      XK_dead_grave,      XK_dead_tilde ])
    ,(50, group [         XK_Shift_L ])
    ,(51, group [       XK_backslash,             XK_bar ])
    ,(52, group [           XK_colon,       XK_semicolon,     XK_dead_ogonek, XK_dead_doubleacute ])
    ,(53, group [               XK_q,               XK_Q ])
    ,(54, group [               XK_j,               XK_J ])
    ,(55, group [               XK_k,               XK_K ])
    ,(56, group [               XK_x,               XK_X ])
    ,(57, group [               XK_b,               XK_B ])
    ,(58, group [               XK_m,               XK_M ])
    ,(59, group [               XK_w,               XK_W ])
    ,(60, group [               XK_v,               XK_V ])
    ,(61, group [               XK_z,               XK_Z ])
    ,(62, group [         XK_Shift_R ])
    ,(63, group [     XK_KP_Multiply,     XK_KP_Multiply,     XK_KP_Multiply])
    ,(64, group [          XK_Meta_L,          XK_Meta_L ])
    ,(65, group [           XK_space ])
    ,(66, group [       XK_Control_L ])
    ,(67, group [              XK_F1,              XK_F1,              XK_F1])
    ,(68, group [              XK_F2,              XK_F2,              XK_F2])
    ,(69, group [              XK_F3,              XK_F3,              XK_F3])
    ,(70, group [              XK_F4,              XK_F4,              XK_F4])
    ,(71, group [              XK_F5,              XK_F5,              XK_F5])
    ,(72, group [              XK_F6,              XK_F6,              XK_F6])
    ,(73, group [              XK_F7,              XK_F7,              XK_F7])
    ,(74, group [              XK_F8,              XK_F8,              XK_F8])
    ,(75, group [              XK_F9,              XK_F9,              XK_F9])
    ,(76, group [             XK_F10,             XK_F10,             XK_F10])
    ,(77, group [        XK_Num_Lock ])
    ,(78, group [     XK_Scroll_Lock ])
    ,(79, group [         XK_KP_Home,            XK_KP_7 ])
    ,(80, group [           XK_KP_Up,            XK_KP_8 ])
    ,(81, group [        XK_KP_Prior,            XK_KP_9 ])
    ,(82, group [     XK_KP_Subtract,     XK_KP_Subtract,     XK_KP_Subtract])
    ,(83, group [         XK_KP_Left,            XK_KP_4 ])
    ,(84, group [        XK_KP_Begin,            XK_KP_5 ])
    ,(85, group [        XK_KP_Right,            XK_KP_6 ])
    ,(86, group [          XK_KP_Add,          XK_KP_Add,          XK_KP_Add])
    ,(87, group [          XK_KP_End,            XK_KP_1 ])
    ,(88, group [         XK_KP_Down,            XK_KP_2 ])
    ,(89, group [         XK_KP_Next,            XK_KP_3 ])
    ,(90, group [       XK_KP_Insert,            XK_KP_0 ])
    ,(91, group [       XK_KP_Delete,      XK_KP_Decimal ])
    ,(92, group [ XK_ISO_Level3_Shift ])
    ,(94, group [            XK_less,         XK_greater,             XK_bar,       XK_brokenbar ])
    ,(95, group [             XK_F11,             XK_F11,             XK_F11])
    ,(96, group [             XK_F12,             XK_F12,             XK_F12])
    ,(98, group [        XK_Katakana ])
    ,(99, group [        XK_Hiragana ])
    ,(100, group [     XK_Henkan_Mode ])
    ,(101, group [ XK_Hiragana_Katakana ])
    ,(102, group [        XK_Muhenkan ])
    ,(104, group [        XK_KP_Enter ])
    ,(105, group [       XK_Control_R ])
    ,(106, group [       XK_KP_Divide,       XK_KP_Divide,       XK_KP_Divide       ])
    ,(107, group [           XK_Print,         XK_Sys_Req ])
    ,(108, group [           XK_Alt_L,           XK_Alt_L ])
    ,(109, group [        XK_Linefeed ])
    ,(110, group [            XK_Home ])
    ,(111, group [              XK_Up ])
    ,(112, group [           XK_Prior ])
    ,(113, group [            XK_Left ])
    ,(114, group [           XK_Right ])
    ,(115, group [             XK_End ])
    ,(116, group [            XK_Down ])
    ,(117, group [            XK_Next ])
    ,(118, group [          XK_Insert ])
    ,(119, group [          XK_Delete ])
    ,(125, group [        XK_KP_Equal ])
    ,(126, group [       XK_plusminus ])
    ,(127, group [           XK_Pause,           XK_Break ])
    ,(129, group [      XK_KP_Decimal,      XK_KP_Decimal ])
    ,(130, group [          XK_Hangul ])
    ,(131, group [    XK_Hangul_Hanja ])
    ,(133, group [         XK_Super_L ])
    ,(134, group [         XK_Super_R ])
    ,(135, group [            XK_Menu ])
    ,(136, group [          XK_Cancel ])
    ,(137, group [            XK_Redo ])
    ,(139, group [            XK_Undo ])
    ,(144, group [            XK_Find ])
    ,(146, group [            XK_Help ])
    ,(187, group [       XK_parenleft ])
    ,(188, group [      XK_parenright ])
    ,(190, group [            XK_Redo ])
    ,(191, group [             XK_bar ])
    ,(192, group [       XK_parenleft ])
    ,(193, group [      XK_parenright ])
    ,(194, group [          XK_Insert ])
    ,(195, group [           XK_Alt_L,           XK_Alt_L ])
    ,(203, group [     XK_Mode_switch ])
    ,(204, group [        XK_NoSymbol,           XK_Alt_L ])
    ,(205, group [        XK_NoSymbol,          XK_Meta_L ])
    ,(206, group [        XK_NoSymbol,         XK_Super_L ])
    ,(207, group [        XK_NoSymbol,         XK_Hyper_L ])
    ,(218, group [           XK_Print ])
    ,(231, group [          XK_Cancel ])
    ]
