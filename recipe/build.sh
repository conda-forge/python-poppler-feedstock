set +e
set -x

echo $MESON_ARGS

if [[ -f "$BUILD_PREFIX/meson_cross_file.txt" ]];
then
    echo "python = '${PREFIX}/bin/python'" >> ${CONDA_PREFIX}/meson_cross_file.txt

    cat $BUILD_PREFIX/meson_cross_file.txt

    $PYTHON -m pip install . -vv --no-build-isolation \
        --config-settings=setup-args=--cross-file=$BUILD_PREFIX/meson_cross_file.txt \
        --config-settings builddir=_build
else
    $PYTHON -m pip install . -vv --no-build-isolation --config-settings builddir=_build
fi

cat _build/meson-logs/meson-log.txt
