<template lang="pug">
.article-image.text-center.my-12(v-editable="segment")
  a(v-if="segment.link" :href="segment.link")
    img.rounded(
      :src="segment.src"
      :class="segment.classes"
      :alt="segment.caption")
  img.rounded(
    v-else
    :src="segment.src"
    :class="segment.classes"
    :alt="segment.caption")
  .max-w-sm.mx-auto(v-if="segment.caption")
    p.font-bold {{ segment.caption }}
</template>

<script>
export default{
  props: ['segment']
}
</script>
