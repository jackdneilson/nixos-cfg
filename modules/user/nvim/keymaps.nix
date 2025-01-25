[
  {
    mode = "i";
    key = "<C-c>";
    action = "<Esc>";
  }
  {
    mode = "n";
    key = "<C-d>";
    action = "<C-d>zz";
  }
  {
    mode = "n";
    key = "<C-u>";
    action = "<C-u>zz";
  }
  {
    mode = "n";
    key = "n";
    action = "nzz";
  }
  {
    mode = "n";
    key = "N";
    action = "Nzz";
  }
  {
    mode = "n";
    key = "<leader>u";
    action = "<cmd>UndotreeToggle<CR>";
  }
  {
    mode = "n";
    key = "<leader>ff";
    action = "<cmd>Telescope find_files<CR>";
  }
  {
    mode = "n";
    key = "<leader>fg";
    action = "<cmd>Telescope live_grep<CR>";
  }
  {
    mode = "n";
    key = "<leader>fb";
    action = "<cmd>Telescope buffers<CR>";
  }
  {
    mode = "n";
    key = "<leader>fr";
    action = "<cmd>Yazi cwd<CR>";
  }
  {
    mode = "n";
    key = "<leader>fv";
    action = "<cmd>Yazi<CR>";
  }
  {
    mode = [ "n" "i" ];
    key = "<C-f>";
    action = "<cmd>lua require('conform').format({ async = true })<CR>";
  }
]
