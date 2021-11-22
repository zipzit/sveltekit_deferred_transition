// /** @type {import('@sveltejs/kit').Config} */
// const config = {
// 	kit: {
// 		// hydrate the <div id="svelte"> element in src/app.html
// 		target: '#svelte'
// 	}
// };

// export default config;

// svelte.config.js
import adapter from '@sveltejs/adapter-node';

export default {
	kit: {
		adapter: adapter({
			// default options are shown
			out: 'build',
			precompress: false,
			env: {
				host: 'HOST',
				port: 'PORT'
			}
		}),
		// hydrate the <div id="svelte"> element in src/app.html
		target: '#svelte'
	}
};
