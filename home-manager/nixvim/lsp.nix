{pkgs, ...}:
{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        bashls.enable = true;
        clangd.enable = true;
        gopls.enable = true;
        nixd.enable = true;
        html.enable = true;
        tsserver.enable = true;
        pylsp.enable = true;
        csharp-ls = {
          enable = true;
          package = pkgs.stable.csharp-ls;
        };
        typst-lsp.enable = true;
      };
      keymaps.lspBuf = {
        gd = {
          action = "definition";
          desc = "LSP: [G]o to [D]efinition";
        };
        gD = {
          action = "declaration";
          desc = "LSP: [G]o to [D]eclaration";
        };
        gT = {
          action = "type_definition";
          desc = "Goto type definition";
        };
        gr = {
          action = "references";
          desc = "LSP: [G]o to [R]eferences";
        };
        gI = {
          action = "implementation";
          desc = "LSP: [G]o to [I]mplementation";
        };
        "K" = {
          action = "hover";
          desc = "LSP: Show documentation";
        };
        "<c-k>" = {
          action = "signature_help";
          desc = "LSP: Show signature help";
        };
        "<leader>rn" = {
          action = "rename";
          desc = "LSP: [R]e[n]ame";
        };
        "<leader>ca" = {
          action = "code_action";
          desc = "LSP: [C]ode [A]ction";
        };
        "<leader>ds" = {
          action = "document_symbol";
          desc = "LSP: [D]ocument [S]ymbols";
        };
        "<leader>ws" = {
          action = "workspace_symbol";
          desc = "LSP [W]orkspace [S]ymbols";
        };
      };
    };
    lsp-lines = {
      enable = true;
      currentLine = true;
    };
    rust-tools.enable = true;
  };
}
