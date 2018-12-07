<template lang="pug">
div.mb-4(v-editable="segment")
  p Img src: {{ segment.image }}
  p {{ segment.caption }}
</template>

<script>
export default{
  props: ['segment']
}
</script>
