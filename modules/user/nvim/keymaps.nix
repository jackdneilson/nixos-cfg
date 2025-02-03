[
  # Best keybind
  {
    mode = "i";
    key = "<C-c>";
    action = "<Esc>";
  }

  # Center viewport when scrolling
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

  # Center viewport when jumping to next/previous
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

  # Move window with C-hjkl
  {
    mode = [ "n" "i" "v" ];
    key = "<C-h>";
    action = "<C-w>h";
  }
  {
    mode = [ "n" "i" "v" ];
    key = "<C-j>";
    action = "<C-w>j";
  }
  {
    mode = [ "n" "i" "v" ];
    key = "<C-k>";
    action = "<C-w>k";
  }
  {
    mode = [ "n" "i" "v" ];
    key = "<C-l>";
    action = "<C-w>l";
  }

  # Undotree
  {
    mode = "n";
    key = "<leader>u";
    action = "<cmd>UndotreeToggle<CR>";
  }

  # Telescope
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
    key = "<leader>fv";
    action = "<cmd>Neotree toggle<CR>";
  }
  {
    mode = "n";
    key = "<leader>fr";
    action = "<cmd>Neotree toggle position=current<CR>";
  }

  # Formatting with require
  {
    mode = [ "n" "i" ];
    key = "<C-f>";
    action = "<cmd>lua require('conform').format({ async = true })<CR>";
  }
]
