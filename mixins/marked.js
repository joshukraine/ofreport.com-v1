const marked = require('marked')

export default {
  methods: {
    renderMd (input) {
      return marked(input)
    }
  }
}
