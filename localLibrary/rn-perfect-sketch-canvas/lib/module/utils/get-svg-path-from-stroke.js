export default function getSvgPathFromStroke(stroke) {
  if (!stroke.length) {
    return '';
  }

  const d = stroke.reduce((acc, _ref, i, arr) => {
    let [x0, y0] = _ref;
    const [x1, y1] = arr[(i + 1) % arr.length];
    acc.push(x0, y0, (x0 + x1) / 2, (y0 + y1) / 2);
    return acc;
  }, ['M', ...stroke[0], 'Q']);
  d.push('Z');
  return d.join(' ');
}
//# sourceMappingURL=get-svg-path-from-stroke.js.map