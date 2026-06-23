class CliHelper < Formula
  desc "Asistente CLI con IA local utilizando Ollama"
  homepage "https://github.com/Maxahup/cli-command-helper"
  version "1.1.0"

  # SECCIÓN PARA MACOS
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/Maxahup/cli-command-helper/releases/download/v1.1.0/cli-helper-darwin-arm64"
      sha256 "57dec9fe6634fab046c1929bf3fb476757f9d385000ea28408a99cf9b619be46"
    elsif Hardware::CPU.intel?
      url "https://github.com/Maxahup/cli-command-helper/releases/download/v1.1.0/cli-helper-darwin-amd64"
      sha256 "c6c6f6da7ef0df9fa5c65690b6c70c4010c49449e9700852cbf69c2404c844b7"
    end

  # SECCIÓN PARA LINUX
  elsif OS.linux?
    if Hardware::CPU.intel? # En la nomenclatura de Homebrew, intel? corresponde a x86_64 / amd64
      url "https://github.com/Maxahup/cli-command-helper/releases/download/v1.1.0/cli-helper-linux-amd64"
      sha256 "3cb82c24e78fc3c6a6a68b8f72ae996a4201220b53c4cad26220a129b0f2e6e2"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "cli-helper-darwin-arm64" => "cli-helper"
      else
        bin.install "cli-helper-darwin-amd64" => "cli-helper"
      end
    elsif OS.linux?
      bin.install "cli-helper-linux-amd64" => "cli-helper"
    end
  end

  test do
    system "#{bin}/cli-helper", "--version"
  end
end
