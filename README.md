# 5M-Elevator
> By [Maximus7474](https://github.com/Maximus7474)

  ![](https://img.shields.io/github/downloads/Maximus7474/5M-Elevator/total?logo=github)
  ![](https://img.shields.io/github/v/release/Maximus7474/5M-Elevator?logo=github)

⚠️ If you are not planning on developping tis script download the latest release.

- For any issues or feature requests please use the [issues tab](https://github.com/Maximus7474/5M-Elevator/issues)
- [CFX Forum Post](https://forum.cfx.re/t/free-elevator-interface/5241372/1)

## Requirements:
- [ox_lib](https://github.com/overextended/ox_lib/releases)
- (optionnal) [ox_target](https://github.com/overextended/ox_target/releases) or [qb-target](https://github.com/qbcore-framework/qb-target)
  - For target enable it in the config.
  - If you don't use any of these scripts you can add your own in `client/modules/targets`
  - Also possible to add another zone script handler in `client/modules/zones` but it is handled by `ox_lib`

## Configuration:
All configuration actions are available in the [config.lua file](https://github.com/Maximus7474/5M-Elevator/blob/1.0.1/shared/config.lua).
To add more elevators copy the template and alter the values by respecting the structure, not respecting it will lead to errors and the resource not working properly.

Specifications:
- The `vehicle` & `restricted` fields are not yet active, more documentation will be made available when implemented.
- The index of the floors table needs to be a string and is suggested to not be longer than 3 characters long.

## Credits:
- [Project Error](https://github.com/project-error) for the react boilerplate [Github Repo](https://github.com/project-error/fivem-react-boilerplate-lua)
