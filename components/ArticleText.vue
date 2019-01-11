<template lang="pug">
.article-text.max-w-700.mx-auto.mb-4.text-lg(
  v-editable="segment"
  v-html="renderMd(segment.content)"
  :class="segment.classes")
</template>

<script>
import marked from '@/mixins/marked'

export default{
  mixins: [
    marked
  ],
  props: ['segment']
}
</script>

<style>
.article-text h3 {
  @apply mt-12;
}

.last-tight p:last-of-type {
  @apply mb-0;
}

.truncate a {
  display: inline-block;
  max-width: 100%;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
</style>
