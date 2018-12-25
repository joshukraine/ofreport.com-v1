<template lang="pug">
div.max-w-md.mx-auto.mb-4.text-lg(v-editable="segment" v-html="content")
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
