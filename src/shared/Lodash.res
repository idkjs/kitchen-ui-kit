
@bs.module external uniq: array<'a> => array<'a> = "lodash.uniq";
@bs.module external sortBy: (array<'a>, 'a => 'b) => array<'a> = "lodash.sortby";