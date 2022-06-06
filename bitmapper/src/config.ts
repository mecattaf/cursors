import path from "path";

const projectRoot = path.resolve("../");
const paths = {
  modern: path.resolve(projectRoot, "svg", "modern"),
  original: path.resolve(projectRoot, "svg", "original"),
  bitmaps: path.resolve(projectRoot, "bitmaps"),
};

// ==> CHANGE COLORS HERE <== //
// Colors
const palette = {
  white: "#FDf6E3",
  black: "#002B36",
  yellow: "#B58900",
  orange: "#CB4B16",
  red: "#DC322F",
  magenta: "#D33682",
  purple: "#6C71C4",
  blue: "#268BD2",
  cyan: "#2AA198",
  green: "#859900",
  dark: "#073642",
  light: "#EEE8D5",
  darkgrey: "#586E75",
  lightgrey: "#93A1A1",
};
// <<END CHANGE>> //

const colors = {
  yellow: {
    base: palette.yellow,
    outline: palette.white,
    watch: {
      background: palette.black,
    },
  },
  orange: {
    base: palette.orange,
    outline: palette.white,
    watch: {
      background: palette.black,
    },
  },
  red: {
    base: palette.red,
    outline: palette.white,
    watch: {
      background: palette.black,
    },
  },
  magenta: {
    base: palette.magenta,
    outline: palette.white,
    watch: {
      background: palette.black,
    },
  },
  purple: {
    base: palette.purple,
    outline: palette.white,
    watch: {
      background: palette.black,
    },
  },
  blue: {
    base: palette.blue,
    outline: palette.white,
    watch: {
      background: palette.black,
    },
  },
  cyan: {
    base: palette.cyan,
    outline: palette.white,
    watch: {
      background: palette.black,
    },
  },
  green: {
    base: palette.green,
    outline: palette.white,
    watch: {
      background: palette.black,
    },
  },
  dark: {
    base: palette.dark,
    outline: palette.lightgrey,
    watch: {
      background: palette.black,
    },
  },
  light: {
    base: palette.light,
    outline: palette.darkgrey,
    watch: {
      background: palette.black,
    },
  },
};

export { paths, colors };
