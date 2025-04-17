import fs from "fs";
import { KarabinerRules } from "./types";
import { createHyperSubLayers, app, open, shortcut } from "./utils";

const bundle_identifiers = [
  "^org\\.virtualbox\\.app\\.VirtualBoxVM$",
  "^com\\.parallels\\.desktop\\.console$",
  "^org\\.vmware\\.fusion$",
  "^org\\.gnu\\.emacs$",
  "^com\\.jetbrains\\.intellij\\.ce$",
  "^com\\.jetbrains\\.PhpStorm$",
  "^com\\.jetbrains\\.pycharm$",
  "^com\\.jetbrains\\.rider$",
  "^com\\.microsoft\\.VSCode$",
  "^com\\.sublimetext\\.3$",
  "^com\\.citrix\\.XenAppViewer$",
  "^com\\.microsoft\\.rdc\\.macos$",
  "^net\\.kovidgoyal\\.kitty$",
];

const rules: KarabinerRules[] = [
  // I've been using my pinky way too often for all they keyboard
  // shortcuts and after months, my hand is starting to hurt, moving the
  // hyper key from caps_lock to my thumb
  //
  // I tried using spacebar as the hyper key but cannot type well
  {
    description: "Hyper Key (⌃⌥⇧⌘)",
    manipulators: [
      {
        description: "; -> Hyper Key",
        from: {
          key_code: "semicolon",
        },
        to: [
          {
            key_code: "left_shift",
            modifiers: ["left_command", "left_control", "left_option"],
          },
        ],
        // If right_command is pressed by itself, homerow will show up
        // Homerow configured under `Clicking - Shorctut`
        to_if_alone: [
          {
            key_code: "6",
            modifiers: [
              "left_command",
              "left_control",
              "left_option",
              "left_shift",
            ],
          },
          // {
          //   key_code: "escape",
          // },
        ],
        type: "basic",
      },
    ],
  },

  // // In case you want to use caps_lock as hyper
  // // This is the way I did it before
  // {
  //   description: "Caps Lock -> Hyper Key",
  //   manipulators: [
  //     {
  //       from: {
  //         key_code: "caps_lock",
  //       },
  //       to: [
  //         {
  //           key_code: "left_shift",
  //           modifiers: ["left_command", "left_control", "left_option"],
  //         },
  //       ],
  //       to_if_alone: [
  //         {
  //           key_code: "escape",
  //         },
  //       ],
  //       type: "basic",
  //     },
  //   ],
  // },

  ...createHyperSubLayers({
    // All the following combinations require the "hyper" key as well
    a: {
      // j: app("Alacritty"),
      // j: app("WezTerm"),
      o: app("Google Chrome"),
      b: app("Brave Browser"),
      t: app("Kitty"),
      f: app("Firefox"),
      // c: shortcut("/Applications/ChatGPT"),
      c: app('Cursor'),
      // l: app("Obsidian"),
      y: app("YouTube"),
      s: app("Slack"),
      e: app("Microsoft Excel"),
      m: app("Microsoft Outlook"),
    },

    // e = "etmux" - This is to SSH to devices
    // video that explains how this works below
    // https://youtu.be/MCbEPylDEWU
  }),
  {
    description: "Caps Lock to Ctrl",
    manipulators: [
      {
        from: {
          key_code: "caps_lock",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "left_control",
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "Ctrl + H/J/K/L to Arrow Keys",
    manipulators: [
      {
        from: {
          key_code: "k",
          modifiers: {
            mandatory: ["left_control"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "up_arrow",
          },
        ],
        type: "basic",
      },
      {
        from: {
          key_code: "h",
          modifiers: {
            mandatory: ["left_control"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "left_arrow",
          },
        ],
        type: "basic",
      },
      {
        from: {
          key_code: "j",
          modifiers: {
            mandatory: ["left_control"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "down_arrow",
          },
        ],
        type: "basic",
      },
      {
        from: {
          key_code: "l",
          modifiers: {
            mandatory: ["left_control"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "right_arrow",
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "Insert (Ctrl) [+Terminal Emulators]",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "insert",
          modifiers: {
            mandatory: ["control"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "c",
            modifiers: ["command"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "Insert (Ctrl)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "insert",
          modifiers: {
            mandatory: ["control"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "c",
            modifiers: ["command"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "Insert (Shift) [+Terminal Emulators]",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "insert",
          modifiers: {
            mandatory: ["shift"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "v",
            modifiers: ["command"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "Insert (Shift)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "insert",
          modifiers: {
            mandatory: ["shift"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "v",
            modifiers: ["command"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "Home",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "home",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "left_arrow",
            modifiers: ["command"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "Home (Ctrl)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "home",
          modifiers: {
            mandatory: ["control"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "up_arrow",
            modifiers: ["command"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "Home (Shift)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "home",
          modifiers: {
            mandatory: ["shift"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "left_arrow",
            modifiers: ["command", "shift"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "Home (Ctrl+Shift)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "home",
          modifiers: {
            mandatory: ["control", "shift"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "up_arrow",
            modifiers: ["command", "shift"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "End",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "end",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "right_arrow",
            modifiers: ["command"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "End (Ctrl)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "end",
          modifiers: {
            mandatory: ["control"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "down_arrow",
            modifiers: ["command"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "End (Shift)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "end",
          modifiers: {
            mandatory: ["shift"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "right_arrow",
            modifiers: ["command", "shift"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "End (Ctrl+Shift)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "end",
          modifiers: {
            mandatory: ["control", "shift"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "down_arrow",
            modifiers: ["command", "shift"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "Backspace (Ctrl)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "delete_or_backspace",
          modifiers: {
            mandatory: ["control"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "delete_or_backspace",
            modifiers: ["option"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "Delete (Ctrl)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "delete_forward",
          modifiers: {
            mandatory: ["control"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "delete_forward",
            modifiers: ["option"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "Enter (Ctrl+Shift)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "return_or_enter",
          modifiers: {
            mandatory: ["control", "shift"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "return_or_enter",
            modifiers: ["command", "shift"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "S (Ctrl)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "s",
          modifiers: {
            mandatory: ["control"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "s",
            modifiers: ["command"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "T (Ctrl)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "t",
          modifiers: {
            mandatory: ["control"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "t",
            modifiers: ["command"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "V (Ctrl)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "v",
          modifiers: {
            mandatory: ["control"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "v",
            modifiers: ["command"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "Z (Ctrl)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "z",
          modifiers: {
            mandatory: ["control"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "z",
            modifiers: ["command"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "Space (Ctrl)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "spacebar",
          modifiers: {
            mandatory: ["control"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "spacebar",
            modifiers: ["command"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "shift + Esc, Tilde to ~",
    manipulators: [
      {
        from: {
          key_code: "escape",
          modifiers: {
            mandatory: ["shift"],
          },
        },
        to: [
          {
            key_code: "grave_accent_and_tilde",
            modifiers: ["shift"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "A (Ctrl)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "a",
          modifiers: {
            mandatory: ["control"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "a",
            modifiers: ["command"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "Alt(Option)+Tab from Command+Tab",
    manipulators: [
      {
        conditions: [],
        from: {
          key_code: "tab",
          modifiers: {
            mandatory: ["left_option"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "tab",
            modifiers: ["command"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "R (Ctrl)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "r",
          modifiers: {
            mandatory: ["control"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "r",
            modifiers: ["command"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "W (Ctrl)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "w",
          modifiers: {
            mandatory: ["control"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "w",
            modifiers: ["command"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "C (Ctrl)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "c",
          modifiers: {
            mandatory: ["control"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "c",
            modifiers: ["command"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "F (Ctrl)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "f",
          modifiers: {
            mandatory: ["control"],
          },
        },
        to: [
          {
            key_code: "f",
            modifiers: ["command"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "N (Ctrl)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "n",
          modifiers: {
            mandatory: ["control"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "n",
            modifiers: ["command"],
          },
        ],
        type: "basic",
      },
    ],
  },
  {
    description: "Enter (Ctrl)",
    manipulators: [
      {
        conditions: [
          {
            bundle_identifiers: bundle_identifiers,
            type: "frontmost_application_unless",
          },
        ],
        from: {
          key_code: "return_or_enter",
          modifiers: {
            mandatory: ["control"],
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "return_or_enter",
            modifiers: ["command"],
          },
        ],
        type: "basic",
      },
    ],
  },
];

fs.writeFileSync(
  "private_karabiner.json",
  JSON.stringify(
    {
      global: {
        ask_for_confirmation_before_quitting: true,
        check_for_updates_on_startup: true,
        show_in_menu_bar: true,
        show_profile_name_in_menu_bar: false,
        unsafe_ui: false,
      },
      profiles: [
        {
          name: "Default",
          complex_modifications: {
            parameters: {
              "basic.simultaneous_threshold_milliseconds": 50,
              "basic.to_delayed_action_delay_milliseconds": 500,
              "basic.to_if_alone_timeout_milliseconds": 1000,
              "basic.to_if_held_down_threshold_milliseconds": 500,
              "mouse_motion_to_scroll.speed": 100,
            },
            rules,
            devices: [
              {
                disable_built_in_keyboard_if_exists: false,
                fn_function_keys: [],
                identifiers: {
                  is_keyboard: true,
                  is_pointing_device: false,
                  product_id: 833,
                  vendor_id: 1452,
                },
                ignore: false,
                manipulate_caps_lock_led: true,
                simple_modifications: [],
                treat_as_built_in_keyboard: false,
              },
              {
                disable_built_in_keyboard_if_exists: false,
                fn_function_keys: [],
                identifiers: {
                  is_keyboard: false,
                  is_pointing_device: true,
                  product_id: 833,
                  vendor_id: 1452,
                },
                ignore: true,
                manipulate_caps_lock_led: false,
                simple_modifications: [],
                treat_as_built_in_keyboard: false,
              },
              {
                disable_built_in_keyboard_if_exists: false,
                fn_function_keys: [],
                identifiers: {
                  is_keyboard: true,
                  is_pointing_device: false,
                  product_id: 64352,
                  vendor_id: 44461,
                },
                ignore: false,
                manipulate_caps_lock_led: true,
                simple_modifications: [],
                treat_as_built_in_keyboard: false,
              },
              {
                disable_built_in_keyboard_if_exists: false,
                fn_function_keys: [],
                identifiers: {
                  is_keyboard: false,
                  is_pointing_device: true,
                  product_id: 64352,
                  vendor_id: 44461,
                },
                ignore: true,
                manipulate_caps_lock_led: false,
                simple_modifications: [],
                treat_as_built_in_keyboard: false,
              },
              {
                disable_built_in_keyboard_if_exists: false,
                fn_function_keys: [],
                identifiers: {
                  is_keyboard: true,
                  is_pointing_device: false,
                  product_id: 34304,
                  vendor_id: 1452,
                },
                ignore: false,
                manipulate_caps_lock_led: true,
                simple_modifications: [],
                treat_as_built_in_keyboard: false,
              },
              {
                disable_built_in_keyboard_if_exists: false,
                fn_function_keys: [],
                identifiers: {
                  is_keyboard: false,
                  is_pointing_device: true,
                  product_id: 2361,
                  vendor_id: 1266,
                },
                ignore: true,
                manipulate_caps_lock_led: false,
                simple_modifications: [],
                treat_as_built_in_keyboard: false,
              },
              {
                disable_built_in_keyboard_if_exists: false,
                fn_function_keys: [],
                identifiers: {
                  is_keyboard: true,
                  is_pointing_device: false,
                  product_id: 32,
                  vendor_id: 1278,
                },
                ignore: false,
                manipulate_caps_lock_led: true,
                simple_modifications: [],
                treat_as_built_in_keyboard: false,
              },
              {
                disable_built_in_keyboard_if_exists: false,
                fn_function_keys: [],
                identifiers: {
                  is_keyboard: true,
                  is_pointing_device: false,
                  product_id: 49285,
                  vendor_id: 1133,
                },
                ignore: false,
                manipulate_caps_lock_led: true,
                simple_modifications: [],
                treat_as_built_in_keyboard: false,
              },
              {
                disable_built_in_keyboard_if_exists: false,
                fn_function_keys: [],
                identifiers: {
                  is_keyboard: false,
                  is_pointing_device: true,
                  product_id: 49285,
                  vendor_id: 1133,
                },
                ignore: true,
                manipulate_caps_lock_led: false,
                simple_modifications: [],
                treat_as_built_in_keyboard: false,
              },
              {
                disable_built_in_keyboard_if_exists: false,
                fn_function_keys: [],
                identifiers: {
                  is_keyboard: true,
                  is_pointing_device: false,
                  product_id: 33,
                  vendor_id: 1278,
                },
                ignore: false,
                manipulate_caps_lock_led: true,
                simple_modifications: [],
                treat_as_built_in_keyboard: false,
              },
              {
                disable_built_in_keyboard_if_exists: false,
                fn_function_keys: [],
                identifiers: {
                  is_keyboard: true,
                  is_pointing_device: false,
                  product_id: 0,
                  vendor_id: 0,
                },
                ignore: false,
                manipulate_caps_lock_led: true,
                simple_modifications: [],
                treat_as_built_in_keyboard: false,
              },
              {
                disable_built_in_keyboard_if_exists: false,
                fn_function_keys: [],
                identifiers: {
                  is_keyboard: false,
                  is_pointing_device: true,
                  product_id: 0,
                  vendor_id: 0,
                },
                ignore: true,
                manipulate_caps_lock_led: false,
                simple_modifications: [],
                treat_as_built_in_keyboard: false,
              },
            ],
            fn_function_keys: [
              {
                from: {
                  key_code: "f1",
                },
                to: [
                  {
                    consumer_key_code: "display_brightness_decrement",
                  },
                ],
              },
              {
                from: {
                  key_code: "f2",
                },
                to: [
                  {
                    consumer_key_code: "display_brightness_increment",
                  },
                ],
              },
              {
                from: {
                  key_code: "f3",
                },
                to: [
                  {
                    apple_vendor_keyboard_key_code: "mission_control",
                  },
                ],
              },
              {
                from: {
                  key_code: "f4",
                },
                to: [
                  {
                    apple_vendor_keyboard_key_code: "spotlight",
                  },
                ],
              },
              {
                from: {
                  key_code: "f5",
                },
                to: [
                  {
                    consumer_key_code: "dictation",
                  },
                ],
              },
              {
                from: {
                  key_code: "f6",
                },
                to: [
                  {
                    key_code: "f6",
                  },
                ],
              },
              {
                from: {
                  key_code: "f7",
                },
                to: [
                  {
                    consumer_key_code: "rewind",
                  },
                ],
              },
              {
                from: {
                  key_code: "f8",
                },
                to: [
                  {
                    consumer_key_code: "play_or_pause",
                  },
                ],
              },
              {
                from: {
                  key_code: "f9",
                },
                to: [
                  {
                    consumer_key_code: "fast_forward",
                  },
                ],
              },
              {
                from: {
                  key_code: "f10",
                },
                to: [
                  {
                    consumer_key_code: "mute",
                  },
                ],
              },
              {
                from: {
                  key_code: "f11",
                },
                to: [
                  {
                    consumer_key_code: "volume_decrement",
                  },
                ],
              },
              {
                from: {
                  key_code: "f12",
                },
                to: [
                  {
                    consumer_key_code: "volume_increment",
                  },
                ],
              },
            ],
            name: "Default profile",
            selected: true,
            simple_modifications: [],
            virtual_hid_keyboard: {
              country_code: 0,
              indicate_sticky_modifier_keys_state: true,
              mouse_key_xy_scale: 100,
            },
          },
        },
      ],
    },
    null,
    2,
  ),
);
