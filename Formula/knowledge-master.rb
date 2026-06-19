class KnowledgeMaster < Formula
  desc "Local-first knowledge graph for developers. Your AI agent's permanent memory."
  homepage "https://github.com/subzone/knowledge-master"
  url "https://github.com/subzone/knowledge-master/archive/refs/tags/v1.0.2.tar.gz"
  license "MIT"

  depends_on "pipx"

  def install
    # Install via pipx into its own isolated environment
    system "pipx", "install", "knowledge-master==1.0.2"
  end

  def post_install
    ohai "knowledge-master installed via pipx"
    ohai "Commands available: km, km-server"
    ohai "Make sure ~/.local/bin is in your PATH"
  end

  def caveats
    <<~EOS
      knowledge-master is installed via pipx.
      
      Ensure ~/.local/bin is in your PATH:
        export PATH="$HOME/.local/bin:$PATH"

      Then:
        km start
        km setup cursor
    EOS
  end

  test do
    system "pipx", "list"
  end
end
