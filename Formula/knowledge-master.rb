class KnowledgeMaster < Formula
  include Language::Python::Virtualenv

  desc "Local-first knowledge graph for developers. Your AI agent's permanent memory."
  homepage "https://github.com/subzone/knowledge-master"
  url "https://github.com/subzone/knowledge-master/archive/refs/tags/v1.0.0.tar.gz"
  license "MIT"

  depends_on "python@3.12"
  depends_on "ollama"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Knowledge Master requires Docker for FalkorDB.
      Start with: km start

      For Ollama embedding model:
        ollama pull nomic-embed-text
    EOS
  end

  test do
    assert_match "Knowledge Master", shell_output("#{bin}/km --help")
  end
end
