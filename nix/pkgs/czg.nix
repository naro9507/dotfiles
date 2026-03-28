{ lib, buildNpmPackage, fetchurl }:

buildNpmPackage rec {
  pname = "czg";
  version = "1.12.0";

  src = fetchurl {
    url = "https://registry.npmjs.org/czg/-/czg-${version}.tgz";
    hash = "sha512-LGltcoZ5m7vhe3WNw16QXqd5WurnHegx9V15MwZJtFAU2AVCYLCqDbwxPUgZOnAcdzzooq33ONcU148HOQsjdA==";
  };

  # 初回ビルド時に正しいハッシュが出力されるので、エラーメッセージの値で置き換える
  npmDepsHash = lib.fakeHash;

  dontNpmBuild = true;

  meta = with lib; {
    description = "Interactive Commitizen adapter, git commit message generator";
    homepage = "https://cz-git.qbb.sh/cli/";
    license = licenses.mit;
    mainProgram = "czg";
  };
}
