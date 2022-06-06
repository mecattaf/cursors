import { builder } from "#root/modules";
import { colors, paths } from "#root/config";

const themes = [
  {
    themeName: "Bibata-Original-Yellow",
    colors: colors.yellow,
  },
  {
    themeName: "Bibata-Original-Orange",
    colors: colors.orange,
  },
  {
    themeName: "Bibata-Original-Red",
    colors: colors.red,
  },
  {
    themeName: "Bibata-Original-Magenta",
    colors: colors.magenta,
  },
  {
    themeName: "Bibata-Original-Purple",
    colors: colors.purple,
  },
  {
    themeName: "Bibata-Original-Blue",
    colors: colors.blue,
  },
  {
    themeName: "Bibata-Original-Cyan",
    colors: colors.cyan,
  },
  {
    themeName: "Bibata-Original-Green",
    colors: colors.green,
  },
  {
    themeName: "Bibata-Original-Dark",
    colors: colors.dark,
  },
  {
    themeName: "Bibata-Original-Light",
    colors: colors.light,
  },
];

const execute = async () => {
  for (const args of themes) {
    await builder.buildBitmaps({
      dir: paths.original,
      out: paths.bitmaps,
      ...args,
    });
  }
};

export { execute };
