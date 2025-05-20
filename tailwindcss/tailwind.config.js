/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
      "./src/**/*.{html,js,jsx,ts,tsx}",  // أو المسارات التي تحتوي على الكلاسات
    ],
    theme: {
      extend: {
        colors: {
          primary: '#1e3a8a',
          secondary: '#f43f5e',
        },
        fontFamily: {
          custom: ['"Cairo"', 'sans-serif'],
          meta: ['"Tagesschrift"', 'sans-serif'],
        },

      },
    },
    corePlugins: {
      // لتعطيل بعض الإضافات مثل float أو container أو others
      float: false,
      container: false,
    },
    plugins: [],
  };
  