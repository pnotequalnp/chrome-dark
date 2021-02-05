{
  description = "Overlay for dark Chrome and Chromium";

  outputs = { ... }: {
    overlay =
      self: super:
      {
        chromium-dark = self.symlinkJoin {
          name = "chromium";
          paths = [ self.chromium ];
          buildInputs = [ self.makeWrapper ];
          postBuild = ''
            wrapProgram $out/bin/chromium --add-flags \
              "--force-dark-mode --enable-features=WebUIDarkMode"
            wrapProgram $out/bin/chromium-browser --add-flags \
              "--force-dark-mode --enable-features=WebUIDarkMode"
          '';
        };

        google-chrome-dark = self.symlinkJoin {
          name = "chromium";
          paths = [ self.google-chrome ];
          buildInputs = [ self.makeWrapper ];
          postBuild = ''
            wrapProgram $out/bin/google-chrome-stable --add-flags \
              "--force-dark-mode --enable-features=WebUIDarkMode"
          '';
        };
      };
  };
}
