
class Reuse < Formula
    desc "Compiler for the Reuse programming language"
    homepage ""
    head "https://github.com/redien/reuse-lang.git"
  
    depends_on "ocaml"
    depends_on "coreutils"

    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"frontend.sh")
        system "mv", (bin/"frontend.sh"), (bin/"reusec")
        system "bash", (libexec/"build.sh")
        system "bash", (libexec/"standard-library/build.sh")
    end
  
    test do
        File.open('test.reuse', 'w') { |file| file.write('(def main (stdin) stdin)') }
        system bin/"reusec", "--output", "test", "--executable", "test.reuse"
        open('|./test', 'w') { puts "hello" }
    end
end
