local utils = require("new-file-template.utils")

local function base_template(relative_path, filename)
  return [[
#include<bits/stdc++.h>

#define ll long long
#define ull unsigned long long
#define pii std::pair<int, int>

#define IO (std::string)""
std::ifstream fin(IO + ".in");
std::ofstream fout(IO + ".out");

#define NMAX 100

|cursor|

void citire(){

}

int main(){
  std::cin.tie(0)->std::ios::sync_with_stdio(0);
  citire();

  return 0;
}
  ]]
end

--- @param opts table
---   A table containing the following fields:
---   - `full_path` (string): The full path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `relative_path` (string): The relative path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `filename` (string): The filename of the new file, e.g., "init.lua".
return function(opts)
  local template = {
    { pattern = ".*", content = base_template },
  }

	return utils.find_entry(template, opts)
end
