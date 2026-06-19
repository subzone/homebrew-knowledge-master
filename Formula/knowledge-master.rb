class KnowledgeMaster < Formula
  desc "Local-first knowledge graph for developers. Your AI agent's permanent memory."
  homepage "https://github.com/subzone/knowledge-master"
  url "https://github.com/subzone/knowledge-master/archive/refs/tags/v1.0.2.tar.gz"
  license "MIT"

  depends_on "pipx"
  depends_on "ollama"

  def install
    system "pipx", "install", "knowledge-master", "--pip-args=--no-cache-dir"
    # Symlink into Homebrew's bin
    bin.install_symlink Dir["#{HOMEBREW_PREFIX}/share/pipx/venvs/knowledge-master/bin/km"]
    bin.install_symlink Dir["#{HOMEBREW_PREFIX}/share/pipx/venvs/knowledge-master/bin/km-server"]
  end

  def caveats
    <<~EOS
      Requires Docker for FalkorDB:
        km start

      Configure your AI tool:
        km setup claude  # or cursor, kiro, copilot, amazonq
    EOS
  end

  test do
    assert_match "Knowledge Master", shell_output("#{bin}/km --help")
  end
end
