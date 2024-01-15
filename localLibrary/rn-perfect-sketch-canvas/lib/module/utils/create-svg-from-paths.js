export default function createSvgFromPaths(paths, options) {
  return `<svg width="${options.width}" height="${options.height}" viewBox="0 0 ${options.width} ${options.height}" fill="none" xmlns="http://www.w3.org/2000/svg">
    <rect width="${options.width}" height="${options.height}" fill="${options.backgroundColor || 'white'}"/>
  <g>
    ${paths.map(path => `<path d="${path.path}" stroke="${path.color}" />`)}
    </g>
    </svg>`;
}
//# sourceMappingURL=create-svg-from-paths.js.map