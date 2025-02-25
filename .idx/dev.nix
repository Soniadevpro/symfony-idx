# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # or "unstable"

  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.symfony-cli
    (pkgs.php82.buildEnv {
       extensions = ({enabled, all}: enabled ++ (with all; [
         iconv
       ]));
    })
    pkgs.php82Packages.composer
  ];

  # See: https://nixos.wiki/wiki/Mysql
  services.mysql = {
    enable = true;
    # package = pkgs.mariadb;
    package = pkgs.mysql80; # For MySQL 8.0
  };

  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      # "vscodevim.vim"
    ];

    # Enable previews
    previews = {
      enable = true;
      previews = {
        web = {
          command = [
          "php"
          "-S"
          "localhost:$PORT"
          "-t"
          "public"
          ];
          manager = "web";
        };
      };
    };

    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        # Example: install JS dependencies from NPM
        # npm-install = "npm install";
        # composer-install = "composer install"; // removed from onCreate
      };
      # Runs when the workspace is (re)started
      onStart = {
        # Example: start a background task to watch and re-build backend code
        # watch-backend = "npm run watch-backend";
        composer-install = "composer install";
      };
    };
  };
}
