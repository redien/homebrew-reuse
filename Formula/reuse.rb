
class Reuse < Formula
    desc "Compiler for the Reuse programming language"
    homepage "https://github.com/redien/reuse-lang"
    head "https://github.com/redien/reuse-lang.git", branch: "base"

    depends_on "ocaml"
    depends_on "coreutils"

    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"reusec")
        bin.write_exec_script (libexec/"reuse_module")
        system "bash", (libexec/"build.sh")
    end

    test do
        File.open('test.reuse', 'w') { |file| file.write('(def main (stdin) stdin)') }
        system bin/"reusec", "--output", "test", "--executable", "test.reuse"
        open('|./test', 'w') { puts "hello" }
    end
end
