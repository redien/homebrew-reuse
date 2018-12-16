
class Reuse < Formula
    desc "Compiler for the Reuse programming language"
    homepage ""
    head "https://github.com/redien/reuse-lang.git"
  
    depends_on "ocaml"
  
    def install
        libexec.install Dir["*"]
        bin.write_exec_script (libexec/"frontend.sh")
        system "mv", (bin/"frontend.sh"), (bin/"reusec")
        system "bash", (libexec/"build.sh")
        system "bash", (libexec/"standard-library/build.sh")
    end
  
    test do
        system "false"
    end
end
