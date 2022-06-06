import { builder } from "#root/modules";
import { colors, paths } from "#root/config";

const themes = [
  {
    themeName: "Bibata-Modern-Yellow",
    colors: colors.yellow,
  },
  {
    themeName: "Bibata-Modern-Orange",
    colors: colors.orange,
  },
  {
    themeName: "Bibata-Modern-Red",
    colors: colors.red,
  },
  {
    themeName: "Bibata-Modern-Magenta",
    colors: colors.magenta,
  },
  {
    themeName: "Bibata-Modern-Purple",
    colors: colors.purple,
  },
  {
    themeName: "Bibata-Modern-Blue",
    colors: colors.blue,
  },
  {
    themeName: "Bibata-Modern-Cyan",
    colors: colors.cyan,
  },
  {
    themeName: "Bibata-Modern-Green",
    colors: colors.green,
  },
  {
    themeName: "Bibata-Modern-Dark",
    colors: colors.dark,
  },
  {
    themeName: "Bibata-Modern-Light",
    colors: colors.light,
  },
];

const execute = async () => {
  for (const args of themes) {
    await builder.buildBitmaps({
      dir: paths.modern,
      out: paths.bitmaps,
      ...args,
    });
  }
};

export { execute };
