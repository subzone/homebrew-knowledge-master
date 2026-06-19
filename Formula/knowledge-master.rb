class KnowledgeMaster < Formula
  desc "Local-first knowledge graph for developers. Your AI agent's permanent memory."
  homepage "https://github.com/subzone/knowledge-master"
  url "https://github.com/subzone/knowledge-master/archive/refs/tags/v1.0.2.tar.gz"
  license "MIT"

  depends_on "python@3.12"
  depends_on "ollama"

  def install
    venv = virtualenv_create(libexec, "python3.12")
    venv.pip_install_and_link buildpath
  end

  def caveats
    <<~EOS
      Knowledge Master requires Docker for FalkorDB:
        km start

      Quick setup for your AI tool:
        km setup claude    # or cursor, kiro, copilot, amazonq
    EOS
  end

  test do
    assert_match "Knowledge Master", shell_output("#{bin}/km --help")
  end
end
