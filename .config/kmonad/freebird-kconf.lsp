(defcfg
  ;; For Linux
  input  (device-file "/dev/input/by-id/usb-KnoblesseOblige_Freebird60-event-kbd")
  output (uinput-sink "My KMonad output")
    ;; To understand the importance of the following line, see the section on
    ;; Compose-key sequences at the near-bottom of this file.
    ;; "/usr/bin/sleep 1 && /usr/bin/setxkbmap -option compose:ralt")
  ;; Comment this is you want unhandled events not to be emitted
  fallthrough true

  ;; Set this to false to disable any command-execution in KMonad
  allow-cmd true
)

(defalias at    (layer-toggle arrowlayer))

(defalias
    acs   (layer-toggle after-ctrl-shift)
    nsft  (layer-toggle normal-shift)
    chold (tap-hold 100 (around-next-timeout 500 lctl XX) @at)
    ;; chold (around-next-timeout 500 lctl @at)
)

;; (defsrc
;;   grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
;;   tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
;;   caps a    s    d    f    g    h    j    k    l    ;    '    ret
;;   lsft z    x    c    v    b    n    m    ,    .    /    rsft
;;   lctl lmet lalt           spc            ralt rmet cmp  rctl
;; )

(defsrc
  esc  1    2    3    4    5    6    7    8    9    0    -    =    bspc
  tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
  caps a    s    d    f    g    h    j    k    l    ;    '    ret
  lsft z    x    c    v    b    n    m    ,    .    /    rsft
  lctl lmet lalt           spc            ralt rctl f10 rmet
)

(deflayer l1
  esc    1    2    3    4    5    6    7    8    9    0    -    =    bspc
  tab    q    w    e    r    t    y    u    i    o    p    [    ]    \
  @chold a    s    d    f    g    h    j    k    l    ;    '    ret
  @nsft  z    x    c    v    b    n    m    ,    .    /    rsft
  @chold lmet lalt           spc            ralt rctl f10  rmet
)

(deflayer arrowlayer
  grv    1      2      3      4      5      6      7      8      9      0      -      =      C-bspc
  C-tab  C-q    C-w    C-e    C-r    C-t    C-y    C-u    C-i    C-o    C-p    C-[    C-]    C-\\
  lctl   C-a    C-s    C-d    C-f    C-g    left   down   up     right  C-;    C-'    C-ret
  @acs   C-z    C-x    C-c    C-v    C-b    C-n    C-m    C-,    C-.    C-/    C-rsft
  lctl   C-lmet C-lalt               spc                  ralt   rctl   f10    rmet
)

(deflayer normal-shift
  S-grv   S-1    S-2    S-3    S-4    S-5    S-6    S-7    S-8    S-9    S-0    S--    S-=    del
  S-tab   S-q    S-w    S-e    S-r    S-t    S-y    S-u    S-i    S-o    S-p    S-[    S-]    S-\\
  @acs    S-a    S-s    S-d    S-f    S-g    S-h    S-j    S-k    S-l    S-;    S-'    S-ret
  XX      S-z    S-x    S-c    S-v    S-b    S-n    S-m    S-,    S-.    S-/    XX
  @acs    S-lmet S-lalt               spc                  ralt   rctl   f10    rmet
)

(deflayer after-ctrl-shift
  XX      1        2        3        4        5        6        7        8        9        0        -        =        S-del
  C-S-tab C-S-q    C-S-w    C-S-e    C-S-r    C-S-t    C-S-y    C-S-u    C-S-i    C-S-o    C-S-p    C-S-[    C-S-]    C-S-\\
  XX      C-S-a    C-S-s    C-S-d    C-S-f    C-S-g    C-S-h    C-S-j    C-S-k    C-S-l    C-S-;    C-S-'    C-S-ret
  XX      C-S-z    C-S-x    C-S-c    C-S-v    C-S-b    C-S-n    C-S-m    C-S-,    C-S-.    C-S-/    XX
  XX      C-S-lmet C-S-lalt                 spc                          ralt     rctl     f10      rmet
)
