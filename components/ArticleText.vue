<template lang="pug">
div.mb-4(v-editable="segment" v-html="content")
</template>

<script>
import marked from 'marked'

export default{
  props: ['segment'],
  computed: {
    content () {
      return marked(this.segment.content)
    }
  }
}
</script>
