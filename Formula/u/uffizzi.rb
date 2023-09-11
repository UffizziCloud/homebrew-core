class Uffizzi < Formula
  desc "Self-serve developer platforms in minutes, not months with k8s virtual clusters"
  homepage "https://uffizzi.com"
  url "https://github.com/UffizziCloud/uffizzi_cli/archive/refs/tags/v2.0.35.tar.gz"
  sha256 "95a541b167307aac7a69416dd621134eefae4f910722fb14d87da0b0b5b116bf"
  license "Apache-2.0"

  uses_from_macos "ruby"

  def install
    system "gem", "install", "uffizzi-cli", "-v", "2.0.35", "--no-document", "--install-dir", libexec
    ENV["GEM_HOME"] = libexec
    ENV["GEM_PATH"] = libexec

    bin.install Dir["#{libexec}/bin/*"]

    bin.env_script_all_files(libexec, GEM_HOME: ENV["GEM_HOME"], GEM_PATH: ENV["GEM_PATH"])
  end

  test do
    assert_match("2.0.35", shell_output("#{bin}/uffizzi version").strip)
  end
end
