module.exports = function(grunt) {

    // 给grunt添加些设置
    grunt.initConfig({

        pkg: grunt.file.readJSON('package.json'),
        time:  new Date().getTime(),

        /**
         * css && html文件中图片添加时间戳
      */

        replace: {
            all: {
                cwd: './source/',
                src: ['**/*.{html,css,jsp}'],
                toreplace: /@@timestamp/g,
                newstring: '<%= time %>' 
            },
           global: {
                cwd: './source/global',
                src: ['**/*.{html,css,jsp}'],
                toreplace: /@@timestamp/g,
                newstring: '<%= time %>' 
            },
            attendance: {
                cwd: './source/attendance',
                src: ['**/*.{html,css,jsp}'],
                toreplace: /@@timestamp/g,
                newstring: '<%= time %>' 
            },
            portal: {
                cwd: './source/portal',
                src: ['**/*.{html,css,jsp}'],
                toreplace: /@@timestamp/g,
                newstring: '<%= time %>' 
            },
            quit: {
                cwd: './source/quit',
                src: ['**/*.{html,css,jsp}'],
                toreplace: /@@timestamp/g,
                newstring: '<%= time %>' 
            },
            ta: {
                cwd: './source/ta',
                src: ['**/*.{html,css,jsp}'],
                toreplace: /@@timestamp/g,
                newstring: '<%= time %>' 
            }
        }

    });
    


    // load custom tasks. 
    grunt.loadTasks('./tasks');
    grunt.registerTask('r', ['replace:all']);
    grunt.registerTask('r_g', ['replace:global']);
    grunt.registerTask('r_a', ['replace:attendance']);
    grunt.registerTask('r_p', ['replace:portal']);
    grunt.registerTask('r_q', ['replace:quit']);
    grunt.registerTask('r_t', ['replace:ta']);
};