{ user }:

{
  greeters = {
    mini = {
      inherit user;
      enable = true;
      extraConfig = ''
        # For reference: https://paste.ee/r/Qpcm4/0
        #
        # LightDM Mini Greeter Configuration
        #
        # To test your configuration out, run: lightdm --test-mode
        
        [greeter]
        # The user to login as.
        user = ${user}
        # Whether to show the password input's label.
        show-password-label = true
        # The text of the password input's label.
        password-label-text = password:
        # The text shown when an invalid password is entered. May be blank.
        invalid-password-text = invalid password
        # Show a blinking cursor in the password input.
        show-input-cursor = false
        # The text alignment for the password input. Possible values are:
        # "left" or "right"
        password-alignment = left
        
        
        [greeter-hotkeys]
        # The modifier key used to trigger hotkeys. Possible values are:
        # "alt", "control" or "meta"
        # meta is also known as the "Windows"/"Super" key
        mod-key = meta
        # Power management shortcuts (single-key, case-sensitive)
        shutdown-key  = p
        restart-key   = r
        hibernate-key = h
        suspend-key   = s
        
        
        [greeter-theme]
        # A color from X11's `rgb.txt` file, a quoted hex string(`"#rrggbb"`) or a
        # RGB color(`rgb(r,g,b)`) are all acceptable formats.
        
        # The font to use for all text
        font = "Cascadia Mono"
        # The font size to use for all text
        font-size = 16px
        # The default text color
        text-color = "#e0def4"
        # The color of the error text
        error-color = "#eb6f92"
        # An absolute path to an optional background image.
        # The image will be displayed centered & unscaled.
        background-image = "/path/to/background.jpg"
        # The screen's background color.
        background-color = "#0c0b11"
        # The password window's background color
        window-color = "#1f1d2e"
        # The color of the password window's border
        border-color = "#9ccfd8"
        # The width of the password window's border.
        # A trailing `px` is required.
        border-width = 2px
        # The pixels of empty space around the password input.
        # Do not include a trailing `px`.
        layout-space = 15
        # The color of the text in the password input.
        password-color = "#e1eef2"
        # The background color of the password input.
        password-background-color = "#1f1d2e"
        # The color of the password input's border.
        password-border-color = "#0c0b11"
        # The width of the password input's border.
        password-border-width = 0
      '';
    };
  };
}
